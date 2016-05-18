class PostsController < ApplicationController
  include PostsHelper
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit]

  def index
    # if params[:search]
    #   @posts = Post.all.where("content LIKE ?", "%#{params[:search]}%")
    #   @categories = unique_category
    # else
      @posts = Post.all
      @categories = unique_category

  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.create!(post_params)
    flash[:alert] = "New post created successfully."
    redirect_to root_path
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:alert] = "Post edited successfully."
    redirect_to root_path
  end

  def destroy
    @post.destroy.save
    @post.comments.each do |comment|
      comment.destroy.save
    end
    flash[:alert] = "Post & Comments destroyed successfully."
    redirect_to user_profile_path
  end

  def sort_newest
    @posts = Post.all.order('created_at DESC')
    @categories = unique_category
    render 'index'
  end

  def sort_oldest
    @posts = Post.all.order('created_at ASC')
    @categories = unique_category
    render 'index'
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :author_id, :category_ids, categories_attributes: [:title])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end
