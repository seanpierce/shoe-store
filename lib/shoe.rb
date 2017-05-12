class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:capitalize_name)
  # sprintf('%.2f', number)

private
  define_method(:capitalize_name) do
    self.name=(name.capitalize)
  end
end
