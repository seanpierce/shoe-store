class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes, dependent: :destroy)
end
