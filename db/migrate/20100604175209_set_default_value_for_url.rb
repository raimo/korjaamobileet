class SetDefaultValueForUrl < ActiveRecord::Migration
  def self.up
    change_column :hot_links, :url, :string, :default => 'http://', :null => false
  end

  def self.down
    change_column :hot_links, :url, :string
  end
end
