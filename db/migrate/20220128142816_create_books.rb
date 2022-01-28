class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.string :title
      t.string :image_id
      t.integer :turn
      t.integer :page
      t.string :genre
      t.string :read_situation
      t.string :last_day
      t.string :content
      
      t.timestamps
    end
  end
end
