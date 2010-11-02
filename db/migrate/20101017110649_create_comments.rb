class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.string :teller
      t.integer :joke_id

      t.timestamps
    end
    add_index :comments, :joke_id
  end

  def self.down
    remove_index :comments, :joke_id
    drop_table :comments
  end
end
