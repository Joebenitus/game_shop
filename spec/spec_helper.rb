require 'rspec'
require 'game'
require 'franchise'
require 'pry'
require 'pg'
require 'dotenv/load'

DB = PG.connect({:dbname => 'game_shop_test', :password => ENV['DB_PASS']})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM franchises *;")
    DB.exec("DELETE FROM games *;")
  end
end