class HotLinksController < ApplicationController
  approves_model
  def index
    @hot_links = HotLink.all(:limit => 8)
    render :partial => 'index'
  end

  def new
    @hot_link = HotLink.new
    render :partial => 'new', :layout => 'ajax'
  end

  def create
    @hot_link = HotLink.new(params[:hot_link])
    @hot_link.save!
    flash.now[:notice] = 'Linkkisi hyväksytään kaikkien näkyville mitä pikimmiten!'
    render :partial => 'hot_link', :object => @hot_link, :layout => 'ajax'
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Et syöttänyt punaisella merkittyjä kenttiä oikein. Huomaa, että URL on Internet-osoite, joka on esimerkiksi tällainen: http://www.example.com/hakemisto/'
    render :partial => 'new', :status => 203, :layout => 'ajax'
  end

  def click
    @hot_link = HotLink.find(params[:id])
    @hot_link.click!
    @hot_link.save!
    render :nothing => true
  end
end
