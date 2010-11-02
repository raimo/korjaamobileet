# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def set_locale
    I18n.locale = :fi
  end

  protected

  def merge_teller(paramhash)
    if session[:user]
      paramhash.merge!(:teller => session[:user]['preferredUsername'])
    end
  end


  def fetch_hotlist
    @best_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', 1.week.ago, Time.now], :order => 'points desc', :limit => Joke::MAX_COUNT)
    @new_jokes = Joke.all(:conditions => ['created_at BETWEEN ? AND ?', 1.week.ago, Time.now], :order => 'created_at desc', :limit => Joke::MAX_COUNT)
    @week = Date.today.cweek
  end

end
