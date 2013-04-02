class Type < ActiveRecord::Base
  attr_accessible :alias, :name, :order
  has_many :products
end
