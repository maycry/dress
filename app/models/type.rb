class Type < ActiveRecord::Base
  attr_accessible :alias, :name, :order, :productname
  has_many :products
  before_save :add_alias
  def add_alias
  	self.alias = Transliteration.transliterate(self.name.mb_chars.downcase.to_s);
  end
  def to_param
  	self.alias
  end
end
