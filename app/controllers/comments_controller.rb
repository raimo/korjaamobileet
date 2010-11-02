class CommentsController < ApplicationController
  before_filter :fetch_joke

  def new
    render :partial => 'new', :object => Comment.new
  end

  def index
    render :partial => 'index', :object => @joke
  end

  def create
    merge_teller(params[:comment])
    @comment = @joke.comments.create(params[:comment])
    if @comment.valid?
      render :partial => 'comment', :object => @comment
    else
      flash.now[:error] = "Please type the message content. Maximum length is #{Comment::MAX_CHARS} characters."
      render :partial => 'new', :object => @comment, :status => 203
    end
  end

  private

  def fetch_joke
    @joke = Joke.find(params[:joke_id])
  end
end
