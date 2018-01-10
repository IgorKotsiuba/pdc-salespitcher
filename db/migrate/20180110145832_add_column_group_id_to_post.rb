class AddColumnGroupIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :group, foreign_key: true
    add_column    :posts, :uuid, :string, null: false
    add_index     :posts, :uuid, unique: true
  end
end
