class AddApprovedToHotLink < ActiveRecord::Migration
  def self.up
    add_column :hot_links, :approved, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :hot_links, :approved
  end
end
