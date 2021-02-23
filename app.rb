require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
  "This is the dope home page for Joe's video game shop."
end

get('/franchises') do
  "This route will show each game franchise we sell."
end