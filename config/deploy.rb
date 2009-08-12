require 'railsmachine/recipes'

# =============================================================================
# REQUIRED VARIABLES
# =============================================================================
# The name of your application. Used for directory and file names
set :application, "doingwrong"

# Target directory for the application on the web and app servers.
set :deploy_to, "/var/www/apps/#{application}"

# Primary domain name of your application. Used as a default for all server roles.
set :domain, "thisiswhatyouredoingwrong.com"

# Login user for ssh.
set :user, "deploy"
set :runner, user
set :admin_runner, user

# Rails environment. Used by application setup tasks and migrate tasks.
set :rails_env, "production"

# =============================================================================
# ROLES
# =============================================================================
# Modify these values to execute tasks on a different server.
role :web, domain
role :app, domain
role :db,  domain, :primary => true
role :scm, domain

# =============================================================================
# APPLICATION SERVER OPTIONS
# ============================================================================= 
set :app_server, :passenger  # :mongrel or :passenger

# =============================================================================
# DATABASE OPTIONS
# =============================================================================
set :database, :mysql   # mysql or postgresql

# =============================================================================
# SCM OPTIONS
# =============================================================================
set :scm, :git
set :repository, "git@github.com:travisr/#{application}.git"

# =============================================================================
# CAPISTRANO OPTIONS
# =============================================================================
set :keep_releases, 5
set :deploy_via, :remote_cache

# action to symlink database file, twitter auth file, and restful authentication files
namespace :deploy do
  desc "Symlink database config file, twitter auth file, and copies restful authentication files."
  task :prepare do
    # symlink db config file
    run "ln -nfs #{shared_path}/system/database.yml #{release_path}/config/database.yml"
    # symlink twitter auth file
    run "ln -nfs #{shared_path}/system/twitter.yml #{release_path}/config/twitter.yml"
    # copy restful_authentication files
    run "cp -r #{shared_path}/system/restful_authentication/* #{release_path}/vendor/plugins/restful_authentication/"
  end
end
 
after 'deploy:update_code', 'deploy:prepare'
