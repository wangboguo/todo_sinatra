# rackup后 代码是从这个文件开始跑的
require './config/environment' # or require_relative 'config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# use ListsController 
# use TasksController  
use UsersController 
run ApplicationController