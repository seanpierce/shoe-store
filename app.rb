require "bundler/setup"
require "./lib/methods"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# path to index
get "/" do
  erb :index
end

# ------------------------------------------------Shoes
# ------------------------------------------------Shoes
# ------------------------------------------------Shoes


# path to see shoe list
get "/shoes" do
  @shoes = Shoe.order(:name)
  erb :shoes
end

# path to add_shoes form
get "/shoes/new" do
  erb :add_shoes
end

# path to see individual shoe
get "/shoe/:id" do
  @shoe = Shoe.find(params['id'])
  @shoes_stores = @shoe.stores.order(:name)
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

# path to add a store association to a shoe
# redirect back to shoe page
patch "/shoe/:id/new/store" do
  shoe = Shoe.find(params['id'])
  # this is a lengthy validation
  # if the input from the add-store-to-shoe select is valid, AND the store is not yet included in the array of stores, then...
  if params['add-store-to-shoe'] != nil && shoe.stores.exclude?(Store.find(params['add-store-to-shoe']))
    shoe.stores << Store.find(params['add-store-to-shoe'])
  end
  redirect "/shoe/#{shoe.id}"
end

# ------------------------------------------------Stores
# ------------------------------------------------Stores
# ------------------------------------------------Stores

# path to see store list
get "/stores" do
  @stores = Store.order(:name)
  erb :stores
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

# path to individual store
get "/store/:id" do
  @store = Store.find(params['id'])
  @stores_shoes = @store.shoes.order(:name)
  erb :store
end

# path to edit store info
patch "/store/:id/edit" do
  store = Store.find(params['id'])
  name = params['edit-store']
  if name != ""
    store.update(name: name)
  end
  redirect "/store/#{store.id}"
end

# path to remove store form DB
delete "/store/:id/delete" do
  Store.find(params['id']).destroy
  redirect "/stores"
end

# path to create a new shoe and add it to a store
post "/store/:id/new/shoe" do
  store = Store.find(params['id'])
  # similar validation written above, this one is adding a shoe association for a store
  if params['add-shoe-to-store'] != nil && store.shoes.exclude?(Shoe.find(params['add-shoe-to-store']))
    store.shoes << Shoe.find(params['add-shoe-to-store'])
  end
  redirect "/store/#{store.id}"
end

# path to remove a shoe associated with a store (from store view)
delete "/store/:id/remove/shoe" do
  store = Store.find(params['id'])
  shoe_id = Shoe.find(params['remove-shoe-from-store'])
  store.shoes.destroy(shoe_id)
  redirect "/store/#{store.id}"
end



















#
