class Style < ActiveRecord::Base
  attr_accessible :alias, :name, :order, :image
  has_many :products
  before_save :add_alias
  has_attached_file :image, 
  	:styles => {:thumb8 => "111x148#", 
		  					:thumb7 => "129x172#"}, 
  	:url  => "/styles/:style_id/:style/:basename.:extension",
  	:path  => "/styles/:style_id/:style/:basename.:extension",
  	:storage => :s3,
    :s3_credentials => S3_CREDENTIALS

  def add_alias
  	self.alias = Transliteration.transliterate(self.name.mb_chars.downcase.to_s);
  end
  def to_param
    self.alias
  end
end
