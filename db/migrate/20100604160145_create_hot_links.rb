class CreateHotLinks < ActiveRecord::Migration
  def self.up
    create_table :hot_links do |t|
      t.string :url
      t.integer :clicked, :default => 0
      t.integer :position, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :hot_links
  end
end
