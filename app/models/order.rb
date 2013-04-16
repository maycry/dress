class Order < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :product_id
  has_many :products
end
