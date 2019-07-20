class CommentsController < ApplicationController

  def new
    if logged_in? == false
     redirect_to root_path, danger: 'コメントするにはログインしてください'
    end
    @topic =  Topic.find_by(params[:topic_id])
    @comment = Comment.new
  end  

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
