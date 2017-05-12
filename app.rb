require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get "/" do
  @recipes = Recipe.all
  @categories = Category.all
  erb :index
end

get '/categories' do
  category = params['selected-category']
  @categories = Category.all
  if category == "all"
    redirect '/'
  else
    selected_category = Category.find_by(name: category)
    @recipes = selected_category.recipes
  end
  erb :index
end

#RECIPE ADD
get "/recipe/new" do
  erb :add_recipe
end

post "/recipe/new" do
  name = params['name']
  instructions = params['instructions']
  Recipe.create(name: name, instructions: instructions)
  redirect '/'
end

#RECIPE PAGE
get "/recipe/:id" do
  @recipe = Recipe.find(params['id'])
  @ingredients = @recipe.ingredients
  erb :recipe
end

#DELETE RECIPE
delete '/recipe/:id/delete' do
  recipe = Recipe.find(params['id']).destroy
  redirect '/'
end

#EDIT RECIPE
patch '/recipe/:id/edit' do
  recipe = Recipe.find(params['id'])
  name = params['edit-name']
  instructions = params['edit-instructions']
  if name == ""
    name = recipe.name
  end
  if instructions == ""
    instructions = recipe.instructions
  end
  recipe.update(name: name, instructions: instructions)
  redirect "/recipe/#{recipe.id}"
end

#ADD Category
post '/recipe/:id/new-category' do
  recipe = Recipe.find(params['id'])
  category = params['category'].downcase
  recipe.categories.find_or_create_by(name: category)
  redirect "/recipe/#{recipe.id}"
end

#ADD ingredient
post '/recipe/:id/new-ingredient' do
  recipe = Recipe.find(params['id'])
  new_ingredient = params['ingredient'].downcase
  recipe.ingredients.find_or_create_by(name: new_ingredient)
  redirect "/recipe/#{recipe.id}"
end

#INGREDIENT PAGE
get '/recipe/:recipe_id/ingredient/:ingredient_id' do
  @ingredient = Ingredient.find(params['ingredient_id'])
  @recipe = Recipe.find(params['recipe_id'])
  erb :ingredient
end

#INGREDIENT EDIT
patch '/recipe/:recipe_id/ingredient/:ingredient_id/edit' do
  ingredient = Ingredient.find(params['ingredient_id'])
  recipe = Recipe.find(params['recipe_id'])
  new_name = params['new_name']
  ingredient.update(name: new_name)
  redirect "/recipe/#{recipe.id}/ingredient/#{ingredient.id}"
end

#INGREDIENT DELETE
delete '/recipe/:recipe_id/ingredient/:ingredient_id/delete' do
  ingredient = Ingredient.find(params['ingredient_id'])
  recipe = Recipe.find(params['recipe_id'])
  recipe.ingredients.destroy(ingredient.id)
  redirect "/recipe/#{recipe.id}"
end























#
