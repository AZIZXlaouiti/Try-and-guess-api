class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :gameStarted , default: false
      t.integer :round , default: 3
      t.timestamps
    end
  end
end
