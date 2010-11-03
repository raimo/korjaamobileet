class JokesController < ApplicationController

  def index
    fetch_hotlist
  end

  def show
    @joke = Joke.find(params[:id])
    unless @joke.to_param == params[:id]
      raise ActionController::RoutingError.new('Not found')
    end
  end

  def new
    @joke = Joke.new
  end

  def create
    merge_teller(params[:joke])
    @joke = Joke.new(params[:joke])

    if @joke.save
      redirect_to(joke_path(@joke), :notice => 'Joke was successfully told. You can now share it with your friends on Twitter or Facebook so that they can come and comment it.')
    else
      render :action => "new"
    end
  end

end
