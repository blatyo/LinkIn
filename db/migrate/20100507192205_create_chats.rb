class CreateChats < ActiveRecord::Migration
  db_magic :connections => [:shard1, :shard2]

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
