class AddPhotoToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :photo, :integer
  end
end
