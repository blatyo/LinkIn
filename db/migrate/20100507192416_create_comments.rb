class CreateComments < ActiveRecord::Migration
  db_magic :connections => [:shard1, :shard2]

  def self.up
    create_table :comments do |t|
      t.text :message
      t.integer :user_id
      t.integer :chat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
