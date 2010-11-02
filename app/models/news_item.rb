class NewsItem < ActiveRecord::Base
  default_scope :order => '"when" desc'
  validates_presence_of :title, :when, :body
  validates_length_of :email, :maximum => 0
  validates_length_of :title, :body, :maximum => 255, :allow_nil => true

  attr_accessor :email

  is_approvable :when, :title, :body, :created_at

  def self.most_important(options = {})
    NewsItem.all(options.merge(:conditions => { :approved => true }))
  end
end
