class Review < ActiveRecord::Base
  attr_accessible :review_text, :reviewer_name, :photo
end
