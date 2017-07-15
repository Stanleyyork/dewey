class CreateImageAnalysisTexts < ActiveRecord::Migration
  def change
    create_table :image_analysis_texts do |t|
      t.string :description
      t.integer :x1
      t.integer :y1
      t.integer :x2
      t.integer :y2
      t.integer :x3
      t.integer :y3
      t.integer :x4
      t.integer :y4
      t.integer :image_analysis_id

      t.timestamps
    end
  end
end
