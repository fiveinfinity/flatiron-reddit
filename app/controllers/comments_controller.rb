class CommentsController < ApplicationController
  before_action :set_comment, only: [:update]

  def comments
    @comments = Comment.where(user_id: params[:id])
    @post = Post.find(author_id: params[:id])
  end

  def create
    @comment = Comment.create!(comment_params)
    redirect_to root_path
  end

  def edit
    @comments = Comment.where(user_id: current_user.id)
  end

  def update
    @comment.update(comment_params)
    redirect_to post_path(@comment.post_id)
  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
