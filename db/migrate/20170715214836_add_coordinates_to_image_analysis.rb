class AddCoordinatesToImageAnalysis < ActiveRecord::Migration
  def change
  	add_column :image_analyses, :x1, :integer
  	add_column :image_analyses, :y1, :integer
  	add_column :image_analyses, :x2, :integer
  	add_column :image_analyses, :y2, :integer
  	add_column :image_analyses, :x3, :integer
  	add_column :image_analyses, :y3, :integer
  	add_column :image_analyses, :x4, :integer
  	add_column :image_analyses, :y4, :integer
  end
end
