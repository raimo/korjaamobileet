ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'main'
  map.resources :news_items, :member => { :approve => :get, :unapprove => :get }
  map.resources :hot_links, :member => { :click => :get, :approve => :get, :unapprove => :get }
  Translate::Routes.translation_ui(map) if RAILS_ENV != "production"
end

ActionController::Routing::Translator.i18n('fi')
