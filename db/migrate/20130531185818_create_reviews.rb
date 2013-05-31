class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.text :review_text

      t.timestamps
    end
  end
end
