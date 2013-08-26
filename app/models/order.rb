class Order < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :product_id, :dimensions
  has_many :products
  serialize :dimensions, Hash

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
end
