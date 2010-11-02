class NewsItemsController < ApplicationController
  approves_model
  def index
    @news_items = NewsItem.all(:limit => 5)
    render :partial => 'index'
  end

	def new
    @news_item = NewsItem.new
    render :partial => 'new'
	end

  def create
    @news_item = NewsItem.new(params[:news_item])
    @news_item.save!
    flash.now[:notice] = 'Uutisesi hyväksytään kaikkien näkyville mitä pikimmiten!'
    render :partial => 'news_item', :object => @news_item, :layout => 'ajax'
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Syöttämissäsi uutiskentissä oli virheitä. Täytä huolellisesti päiväys, otsikko ja sisältö.'
    render :partial => 'new', :status => 203, :layout => 'ajax'
  end
end
