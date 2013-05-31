class Designer < ActiveRecord::Base
  attr_accessible :alias, :name, :order
  has_many :products
  before_save :add_alias
  default_scope order("name")
  def add_alias
  	self.alias = Transliteration.transliterate(self.name.mb_chars.downcase.to_s);
  end
  def to_param
  	self.alias
  end
end
