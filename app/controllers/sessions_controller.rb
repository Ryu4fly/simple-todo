class SessionsController < ApplicationController
  skip_before_action :authorize

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if authenticate_password(params[:password], user)
      session[:user_id] = user.id
      redirect_to user_url(user)
    else
      redirect_to login_url alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end

  private

  def authenticate_password(password, user)
    return Argon2::Password.verify_password(password, user.password)
  end
end
