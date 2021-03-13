class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.float :built_area
      t.belongs_to :user, index: true
      t.float :carpet_area
      t.date :posted_date
      t.string :available_for
      t.integer :floor_no
      t.string :type_of
      t.integer :total_floor
      t.date :age
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :balcony
      t.float :parking_area
      t.string :description

      t.timestamps
    end
  end
end
