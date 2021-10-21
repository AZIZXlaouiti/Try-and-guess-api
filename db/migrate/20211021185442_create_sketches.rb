class CreateSketches < ActiveRecord::Migration[6.1]
  def change
    create_table :sketches do |t|
      t.boolean  :drawMode, default: true
      t.string :strokeColor , default: "red"
      t.integer :strokeWidth , default: 7
      t.timestamps
    end
  end
end
