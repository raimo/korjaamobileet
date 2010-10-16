class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def fetch_hotlist
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week], :order => 'points desc')
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week])
    @week = Date.today.cweek
  end
end
