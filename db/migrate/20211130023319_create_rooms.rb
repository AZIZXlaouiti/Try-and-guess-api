class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :game_started , default: false
      t.integer :max_round , default: 3
      t.integer :round , default: 1 
      t.integer :max_users , default: 4
      t.timestamps
    end
  end
end
