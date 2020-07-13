require "bundler/setup"
require 'yaml'
require 'active_record'
require 'bundler/setup'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DB = ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'db/tvshows.db'
})

require_all 'models'

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
