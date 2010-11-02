class UpdatePointsInJoke < ActiveRecord::Migration
  def self.up
    change_column :jokes, :points, :integer, :default => 0, :null => false
  end

  def self.down
    change_column :jokes, :points, :integer
  end
end
