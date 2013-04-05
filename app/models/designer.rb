class Designer < ActiveRecord::Base
  attr_accessible :alias, :name, :order
  before_save :add_alias
  def add_alias
  	self.alias = Transliteration.transliterate(self.name.mb_chars.downcase.to_s);
  end
end
