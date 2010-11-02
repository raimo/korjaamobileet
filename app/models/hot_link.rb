class HotLink < ActiveRecord::Base
  validates_presence_of :url
  validates_presence_of :title
  validates_numericality_of :clicked, :integer => true, :minimum => 0
  validates_numericality_of :position, :integer => true, :minimum => 0
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix

  validates_length_of :url, :title, :maximum => 255

  validates_length_of :email, :maximum => 0, :allow_nil => true
  attr_accessor :email

  is_approvable :title, :url, :created_at

  def click!
    self.clicked += 1
  end

  def self.most_important(options = {})
    options = {:limit => 8 }.merge(options)
    newest_count = options[:limit]*3/8
    newest = HotLink.all(:order => 'created_at desc', :limit => newest_count, :conditions => {:approved => true})
    popular = HotLink.all(options.merge(:order => 'clicked desc', :conditions => {:approved => true}))
    return (newest + popular).uniq.sort_by {|hl| -hl.clicked }[0,8]
  end

  def today?
    created_at.localtime.to_date == Date.today
  end
end
