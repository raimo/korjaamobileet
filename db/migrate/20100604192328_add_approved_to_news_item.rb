class AddApprovedToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :approved, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :news_items, :approved
  end
end
