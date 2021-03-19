class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :property, index: true
      t.integer :final_price
      t.date :start_date
      t.date :end_date
      t.string :transaction_id
      t.string :payment_mode
      t.string :contract_type
      t.text :details

      t.timestamps
    end
  end
end
