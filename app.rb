require('sinatra')
require('sinatra/reloader')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'game_shop'})

get('/') do
  "This is the dope home page for Joe's video game shop."
end

get('/franchises') do
  "This route will show each game franchise we sell."
end