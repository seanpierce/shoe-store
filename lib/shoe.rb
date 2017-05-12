class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  # sprintf('%.2f', number)
end
