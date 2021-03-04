class ChangeIntegerLimitInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mobile, :integer, limit: 8
  end
end

