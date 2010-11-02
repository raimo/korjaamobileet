class MainController < ApplicationController
  #caches_page :index
  def index
    @news_items = NewsItem.most_important(:limit => 6)
    @hot_links = HotLink.most_important(:limit => 8)
  end

end
