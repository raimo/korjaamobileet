class AddTellerToJoke < ActiveRecord::Migration
  def self.up
    add_column :jokes, :teller, :string
  end

  def self.down
    remove_column :jokes, :teller
  end
end
