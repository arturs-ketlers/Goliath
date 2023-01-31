set :stage, :production
set :rails_env, fetch(:stage)

set :user, fetch(:application)
set :deploy_to, "/var/www/#{fetch(:application)}"

server '104.248.41.182', port: 22, user: fetch(:application), roles:  %w{web app db}, primary: true
