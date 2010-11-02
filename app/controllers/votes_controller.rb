class VotesController < ApplicationController
  def cast
    vote = Joke.find(params[:joke_id]).votes.create(:ip => request.remote_ip)
    if vote.valid?
      flash.now[:notice] = 'Your vote was cast successfully!'
    else
      flash.now[:error] = 'Sorry, but you can vote one joke only once per day.'
    end

    if params[:joke_content]
      render :partial => 'shared/flash_messages'
    else
      fetch_hotlist
      render :partial => 'jokes/hotlist'
    end
  end
end
