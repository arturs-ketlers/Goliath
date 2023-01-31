# config valid only for current version of Capistrano
lock '3.14.1'

set :application,      ENV['app'] || 'goliath'
set :repo_url,         'git@github.com:arturs-ketlers/Goliath.git'
set :branch,           ENV['branch'] || 'main'

set :rvm_type,         :system
set :rvm_ruby_version, File.read("#{File.dirname(__FILE__)}/../.ruby-version").chomp
# set :rvm_map_bins,     fetch(:rvm_map_bins, []).push(:sidekiq, :sidekiqctl)
# set :bundle_bins,      fetch(:bundle_bins, []).push(:sidekiq, :sidekiqctl)

set :bundle_flags,     '--deployment'

set :linked_files,     %w{config/database.yml}
set :linked_dirs,      %w{public/system public/ckeditor_assets log tmp/backup tmp/pids tmp/cache tmp/sockets public/uploads}
set :whenever_roles,  -> { [:web, :app] }

set :puma_conf,        "#{shared_path}/config/puma.rb"

set :log_level,        :info
set :sidekiq_default_hooks, false

set :sitemap_roles, :web # default



namespace :puma do
  Rake::Task[:restart].clear_actions

  desc "Overwritten puma:restart task"
  task :restart do
    puts "Overwriting puma:restart to ensure that puma is running. Effectively, we are just starting Puma."
    puts "A solution to this should be found."
    invoke 'puma:stop'
    invoke 'puma:start'
  end
end

namespace :sidekiq do
  desc 'Check if sidekiq needed to be run for the app'
  task :check do
    on roles(:all) do
      info 'Sidekiq detected, enabling'
      # if test '[[ "$ENABLED_PACKAGES" =~ (google|dropbox)_storage ]]'
      # else
      #   info 'No sidekiq setup detected, skipping'
      #   set :sidekiq_default_hooks, false
      # end
    end
  end
end

namespace :elasticsearch do
  desc 'Reindex elastic DB'
  task :reindex do
    on roles(:app, select: :primary) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'search:reindex'
        end
      end
    end
  end
end

namespace :db do
  %w[create migrate reset rollback seed setup fake drop set_release_date].each do |command|
    desc "Rake db:#{command}"
    task command do
      on roles(:db, select: :primary) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "db:#{command}"
          end
        end
      end
    end
  end
end

namespace :cache do
  desc "Clear cache"
  task "clear" do
    on roles(:db, select: :primary) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "cache:clear"
        end
      end
    end
  end
end

after 'deploy:migrate', 'db:seed'
after 'deploy:migrate', 'cache:clear'
after 'deploy:migrate', 'sitemap:refresh'

# before "deploy:assets:precompile", "deploy:yarn_install"

# namespace :deploy do
#   desc 'Run rake yarn:install'
#   task :yarn_install do
#     on roles(:web) do
#       within release_path do
#         execute("cd #{release_path} && yarn install")
#       end
#     end
#   end
# end
