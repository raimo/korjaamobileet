class Comment < ActiveRecord::Base
  MAX_CHARS = 255
  validates_presence_of :body
  validates_length_of :body, :maximum => MAX_CHARS
  validates_presence_of :joke_id

  def author
    return teller unless teller.blank?
    return 'Anonymous'
  end
end
