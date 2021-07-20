class TopicsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = '写真を投稿しました。'
      redirect_to root_url
    else
      @pagy, @topics = pagy(current_user.topics.order(id: :desc))
      flash.now[:danger] = '写真の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @topic.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    unless @topic
      redirect_to root_url
    end
  end

  def topic_params
    params.require(:topic).permit(:description, :image)
  end
end
