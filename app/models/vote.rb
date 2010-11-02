class Vote < ActiveRecord::Base
  after_create :increase_points

  belongs_to :joke

  validate :only_one_answer_per_day

  attr_protected :created_at, :joke, :joke_id

  private

  def only_one_answer_per_day
    last_vote = Vote.find_by_ip_and_joke_id(self.ip, self.joke_id, :order => 'created_at desc')
    if last_vote and last_vote.id != self.id and last_vote.created_at.today?
      self.errors.add(:base, 'Sorry, but you can vote one joke only once per day.')
    end
  end

  def increase_points
    Joke.transaction do
      self.joke.update_attribute(:points, joke.points+1)
    end

  end
end
