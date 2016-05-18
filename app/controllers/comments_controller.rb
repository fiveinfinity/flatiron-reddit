class CommentsController < ApplicationController
  include PostsHelper
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.where(user_id: params[:user_id])
  end

  def create
    @comment = Comment.create!(comment_params)
    flash[:alert] = "New comment created successfully."
    redirect_to :back
  end

  def edit
    @comments = Comment.where(user_id: current_user.id)
  end

  def update
    @comment = Comment.find(params[:comment][:id])
    @comment.update(content: params[:comment][:content])
    flash[:alert] = "Comment updated successfully."
    redirect_to post_path(@comment.post_id)
  end

  def destroy
    @comment.destroy
    @comment.save
    flash[:alert] = "Comment destroyed successfully."
    redirect_to user_profile_path
  end

  def sort_most
    @posts = Post.all.sort {|a,b| b.comments.count <=> a.comments.count}
    @categories = unique_category
    render 'posts/index'
  end

  def sort_least
    @posts = Post.all.sort {|a,b| a.comments.count <=> b.comments.count}
    @categories = unique_category
    render 'posts/index'
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
