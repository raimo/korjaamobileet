require 'rpx'

class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]


  def new
    session[:return_url] = params[:return_url]
    oauth = Koala::Facebook::OAuth.new(FB_APP_ID, FB_SECRET, URI.escape(create_session_url))
    @facebook_url = oauth.url_for_oauth_code
    p @facebook_url
  end

  def create
    username = if params[:token]
                 rpx_login
               elsif params[:code]
                 fb_login
               end

    p username
    if username
      flash[:notice] = "You logged in as #{username} successfully!"
      if session[:return_url]
        return_url = session[:return_url]
        session[:return_url] = nil
        redirect_to return_url
      elsif params[:minimal]
        render :partial => 'profile'
      else
        redirect_to root_path
      end
    else
      render :action => 'new'
    end
    
  end

  def delete
    reset_session
    flash[:notice] = "You logged out successfully!"
    redirect_to root_path
  end

  private

  def rpx_login
    rpx = Rpx::RpxHelper.new('d2ddd35ee36abe7b494ad8dd684d1c4275d422c0',
                  'https://rpxnow.com',
                  'tellajoke.rpxnow.com')
    resp = rpx.auth_info(params[:token])
    p resp
    session[:user] = resp
    return resp['preferredUsername'] if resp
  end

  def fb_login
    oauth = Koala::Facebook::OAuth.new(FB_APP_ID, FB_SECRET, URI.escape(create_session_url))
    @graph = Koala::Facebook::GraphAPI.new(oauth.get_access_token(params[:code]))
    user = @graph.get_object('me')
    p user
    session[:user] = {'identifier' => user['id'], 'preferredUsername' => user['name']}
    return user['name']
  rescue Koala::Facebook::APIError
    return nil
  end
end
