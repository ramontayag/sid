$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'active_record'
require 'rspec'
require 'sid'
require 'spec/fixtures/page'
require 'spec/fixtures/category'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

#Allow to connect to SQLite
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)

RSpec.configure do |config|

end

def reset_database
  %W(pages categories).each do |table_name|
    ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS '#{table_name}'")
  end
  ActiveRecord::Base.connection.create_table(:pages) do |t|
    t.string :name
    t.integer :account_id
    t.integer :sid
  end
  ActiveRecord::Base.connection.create_table(:categories) do |t|
    t.string :name
    t.integer :account_id
    t.integer :alternative_sid
  end
end
