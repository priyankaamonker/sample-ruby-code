class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and authenticate(params[:name], params[:password])
      session[:user_id] = user.id;
      session[:user_name] = user.name;
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combnation";
    end
  end

  def destroy
    session[:user_id] = nil;
    session[:user_name] = nil;
    redirect_to cms_url, notice: "Logged out";
  end

  def authenticate(name, password)
    user = User.find_by(name: name)
    if user.password == password
      return true
    else 
      return false
    end
  end
end
