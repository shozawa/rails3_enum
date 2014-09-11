require 'rubygems'
require 'active_support'
require 'active_record'
require 'active_model'

require 'rails3_enum'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Migration.verbose = false

def setup_db
  ActiveRecord::Schema.define(version: 1) do
    create_table :conversations do |t|
      t.integer :status
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Conversation < ActiveRecord::Base
  enum status: [:active, :archived]
end

RSpec.configure do |config|
  config.before do
    setup_db
  end
  config.after do
    teardown_db
  end
end
