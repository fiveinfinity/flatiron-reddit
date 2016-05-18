class ApplicationController < ActionController::Base
  include PostsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def search
    @posts = Post.all.where("content LIKE ?", "%#{params[:search]}%")
    @categories = unique_category
    render :index
  end
end
