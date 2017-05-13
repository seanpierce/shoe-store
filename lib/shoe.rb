class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, :presence => true, on: :create
  validates :cost, :presence => true, on: :create
  before_save :capitalize_name

  def to_money(cost)
    sprintf('%.2f', cost)
  end

private
  define_method(:capitalize_name) do
    split_name = self.name.split(' ')
    cap_name = []
    split_name.each do |word|
      cap_name.push(word.capitalize)
    end
    self.name=(cap_name.join(' '))
  end
end
