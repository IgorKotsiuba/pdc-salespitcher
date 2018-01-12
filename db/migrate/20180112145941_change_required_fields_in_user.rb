class ChangeRequiredFieldsInUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name, :string,  null: true
  end

  def down
    change_column :users, :first_name, :string
    change_column :users, :last_name, :string
  end
end
