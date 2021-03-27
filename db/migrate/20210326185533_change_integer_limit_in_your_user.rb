class ChangeIntegerLimitInYourUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :mobile, :integer, limit: 8
  end

  def down
    change_column :users, :mobile, :integer, limit: 8
  end
end
