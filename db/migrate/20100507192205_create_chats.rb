class CreateChats < ActiveRecord::Migration
  def self.up
    create_table :chats do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chats
  end
end
