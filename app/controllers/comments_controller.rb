class CommentsController < ApplicationController
  def new
  end
  
  def show
    @comment = Comment.new
    @comments = Comment.all
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to comments_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :festival_id)
  end
end
