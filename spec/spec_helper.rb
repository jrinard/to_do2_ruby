require('rspec')
require('pg')
require('task')
require('pry')
# require('list')

DB = PG.connect({:dbname => 'to_do_josh_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")
  end
end
