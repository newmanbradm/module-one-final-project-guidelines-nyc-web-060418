class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.integer :traveller_id
      t.integer :attraction_id
      t.string :date
    end
  end
end
