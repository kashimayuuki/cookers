class AddGenreIdToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :genre_id, :integer
  end
end
