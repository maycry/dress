class Order < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :product_id
  has_many :products

  validates :name, :presence => true
  validates :phone, :presence => true
end
