class SetExistingDataApproved < ActiveRecord::Migration
  def self.up
    HotLink.update_all(:approved => true)
    NewsItem.update_all(:approved => true)
  end

  def self.down
    NewsItem.update_all(:approved => false)
    HotLink.update_all(:approved => false)
  end
end
