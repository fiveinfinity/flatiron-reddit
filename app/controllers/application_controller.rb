class ApplicationController < ActionController::Base
  include PostsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def search
  #   @posts = Post.all.where("content LIKE ?", "%#{params[:search]}%")
  #   @categories = unique_category
  #   render :index
  # end

  def search
    @posts = Post.search(params[:search])
    @categories = unique_category
    render :index
  end

  def sort_newest
    @posts = Post.all.order('created_at DESC')
    @categories = unique_category
    render :index
  end

  def sort_oldest
    @posts = Post.all.order('created_at ASC')
    @categories = unique_category
    render :index
  end

  def sort_most
    @posts = Post.sort_most
    @categories = unique_category
    render 'posts/index'
  end

  def sort_least
    @posts = Post.all.sort {|a,b| a.comments.count <=> b.comments.count}
    @categories = unique_category
    render 'posts/index'
  end
end
