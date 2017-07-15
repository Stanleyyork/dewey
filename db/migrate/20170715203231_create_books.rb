class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.text :description
      t.integer :page_count
      t.string :thumbnail
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
