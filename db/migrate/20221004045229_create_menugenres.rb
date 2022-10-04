class CreateMenugenres < ActiveRecord::Migration[6.1]
  def change
    create_table :menugenres do |t|
      t.integer :genre_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
