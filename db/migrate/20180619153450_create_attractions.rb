class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :city
      t.float :price
      t.boolean :family_friendly
    end
  end
end
