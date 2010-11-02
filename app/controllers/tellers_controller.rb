class TellersController < ApplicationController
  def index
    @tellers = Joke.all(:select => 'teller, SUM(points) points', :group => 'teller', :conditions => ['teller IS NOT NULL'], :order => 'SUM(points) DESC')
    p @tellers
  end
end
