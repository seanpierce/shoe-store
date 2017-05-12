require "bundler/setup"
require "./lib/methods"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# path to index
get "/" do
  erb :index
end

# path to see shoe list
get "/shoes" do
  @shoes = Shoe.order(:name)
  erb :shoes
end

# path to see store list
get "/stores" do
  @stores = Store.order(:name)
  erb :stores
end

# path to add_shoes form
get "/shoes/new" do
  erb :add_shoes
end

# path to see individual shoe
get "/shoe/:id" do
  @shoe = Shoe.find(params['id'])
  erb :shoe
end

# path to edit individual shoe information
# although initial validation is set for creation, I've decided to write a simple set of conditions to allow the user the ability to update all shoe information from one single form
patch "/shoe/:id/edit" do
  shoe = Shoe.find(params['id'])
  name = params['edit-shoe']
  cost = params['edit-shoe-cost']
  if name != ""
    shoe.update(name: name)
  end
  if cost != ""
    shoe.update(cost: cost)
  end
  redirect "/shoe/#{shoe.id}"
end

# path to remove shoe from DB
delete "/shoe/:id/delete" do
  Shoe.find(params['id']).destroy
  redirect "/shoes"
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
