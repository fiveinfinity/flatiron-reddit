class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit]

  def index
    @categories = Category.all
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.create!(post_params)
    redirect_to root_path
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post.destroy
    if current_user
      redirect_to user_profile_path
    else
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id, :author_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end
