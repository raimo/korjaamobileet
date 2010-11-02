class AddTitleToHotLink < ActiveRecord::Migration
  def self.up
    add_column :hot_links, :title, :string
  end

  def self.down
    remove_column :hot_links, :title
  end
end
