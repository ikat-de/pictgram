class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users, :comment_users)
    @comments = Comment.all
    @favorites =  Favorite.all
  end
  
  def new
    # if logged_in? == false
    # redirect_to root_path, danger: '投稿するにはログインしてください'
    # end
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  
  def topic_params
      params.require(:topic).permit(:image, :description)
  end
end


