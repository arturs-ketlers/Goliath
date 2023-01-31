set :stage, :production
set :rails_env, fetch(:stage)

set :user, fetch(:application)
set :deploy_to, "/var/www/#{fetch(:application)}"

server '159.148.57.25', port: 22, user: fetch(:application), roles:  %w{web app db}, primary: true
