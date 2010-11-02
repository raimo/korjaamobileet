class CreateJokes < ActiveRecord::Migration
  def self.up
    create_table :jokes do |t|
      t.text :body
      t.integer :points
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jokes
  end
end
