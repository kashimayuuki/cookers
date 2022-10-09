class AddUserIdToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :user_id, :integer
  end
end
