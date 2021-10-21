class CreatePaths < ActiveRecord::Migration[6.1]
  def change
    create_table :paths do |t|
      t.belongs_to :sketch, null: false, foreign_key: true
      t.float :x  
      t.float :y 
      t.timestamps
    end
  end
end
