class AddDescriptionToImageAnalysis < ActiveRecord::Migration
  def change
  	add_column :image_analyses, :description, :text
  end
end
