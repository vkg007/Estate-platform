class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.integer :pincode
      t.text :full_address
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
