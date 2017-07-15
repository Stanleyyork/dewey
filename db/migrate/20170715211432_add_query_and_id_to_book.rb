class AddQueryAndIdToBook < ActiveRecord::Migration
  def change
  	add_column :books, :query, :string
  	add_column :books, :image_analysis_id, :integer
  end
end
