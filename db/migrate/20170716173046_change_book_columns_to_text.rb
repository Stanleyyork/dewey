class ChangeBookColumnsToText < ActiveRecord::Migration
  def change
  	change_column :books, :title, :text
  	change_column :books, :authors, :text
  	change_column :books, :thumbnail, :text
  	change_column :books, :query, :text
  end
end
