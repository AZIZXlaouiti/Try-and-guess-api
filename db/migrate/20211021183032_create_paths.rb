class CreatePaths < ActiveRecord::Migration[6.1]
  def change
    create_table :paths do |t|
      t.belongs_to :canvasSketch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
