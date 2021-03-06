# environment.rb里面的所有东西，是运行rackup后最先跑的(因为config.ru里面require了)

ENV['SINATRA_ENV'] ||= "development"

# bundle可以require 所有gem里面提到的
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# 这个是active_record里面的做法
# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/todo.sqlite"
# )

# 连接数据库 这个是sinatra/activerecord里面的做法
set :database, {adapter: "sqlite3", database: "db/todo.sqlite"}

# or use require_all gem
# 有了这一步，才知道诸如User这些类代表什么
Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }