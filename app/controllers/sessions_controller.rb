class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by!(:uid => auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end
    sign_in(:user, user)
    session[:user_id] = user.id
    redirect_to :root
  end

  def auth
    request.env['omniauth.auth']
  end

  def profile
    if current_user
      @user = current_user
      @posts = Post.where(author_id: @user.id)
    else
      redirect_to root_path
    end
  end
end
