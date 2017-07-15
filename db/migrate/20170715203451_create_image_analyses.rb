class CreateImageAnalyses < ActiveRecord::Migration
  def change
    create_table :image_analyses do |t|
      t.string :image_link

      t.timestamps
    end
  end
end
