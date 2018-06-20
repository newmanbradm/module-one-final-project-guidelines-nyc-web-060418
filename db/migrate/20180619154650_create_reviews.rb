class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :traveller_id
      t.integer :attraction_id
      t.integer :rating
      t.text :message
    end
  end
end
