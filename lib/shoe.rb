class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, :presence => true
  before_save :capitalize_name

  def to_money(cost)
    sprintf('%.2f', cost)
  end

private
  define_method(:capitalize_name) do
    self.name=(name.capitalize)
  end
end
