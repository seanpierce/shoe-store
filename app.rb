require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + './lib/*.rb'].each { |file| require file }

# path to index
get "/" do
  erb :index
end

# path to see shoe list
get "/shoes" do
  @shoes = Shoe.all
  erb :shoes
end

# path to see store list
get "/stores" do
  @stores = Store.all
  erb :stores
end

# path to add_shoes form
get "/shoes/new" do
  erb :add_shoes
end

# post new shoe to DB path (redirect to shoes list)
post "/shoes/new" do
  name = params['new-shoe'].cap_name
  cost = params['new-shoe-cost'].to_i
  Shoe.find_or_create_by(name: name, cost: cost)
  redirect "/shoes"
end

# path to add_stores form
get "/stores/new" do
  erb :add_stores
end

# post new store to DB path (redirect to stores list)
post "/stores/new" do
  name = params['new-store'].cap_name
  Store.find_or_create_by(name: name)
  redirect "/stores"
end


























#
