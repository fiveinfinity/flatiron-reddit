class ApplicationController < ActionController::Base
  include PostsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def search
    @posts = Post.search(params[:search])
    render json: @posts
  end

  def sort_newest
    @posts = Post.all.order('created_at DESC')
    render json: @posts
  end

  def sort_oldest
    @posts = Post.all.order('created_at ASC')
    render json: @posts
  end

  def sort_most
    @posts = Post.all.sort {|a,b| b.comments.count <=> a.comments.count}
    render json: @posts
  end

  def sort_least
    @posts = Post.all.sort {|a,b| a.comments.count <=> b.comments.count}
    render json: @posts
  end
end
