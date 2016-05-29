class PostsController < ApplicationController
  include PostsHelper
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit]

  def index
    @posts = Post.all

    respond_to do |f|
      f.html { render :index }
      f.json { render json: @posts }
    end
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

  def time
    @time = {"time": "#{Date.parse(params["time"]).strftime("%A, %b %d")}"}
    render json: @time
  end

  def find_author
    found_author = User.find(params["author"])
    @author = {"author": "#{found_author["email"]}"}
    render json: @author
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
