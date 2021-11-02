class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true
      t.string :content
      t.boolean :guess , default: false
      t.timestamps
    end
  end
end
