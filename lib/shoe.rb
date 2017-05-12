
class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients, dependent: :destroy)
  has_and_belongs_to_many(:categories, dependent: :destroy)
end

# JOIN TABLE COLUMNS IN ALPHABETICAL ORDER
class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)

end

class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
end
