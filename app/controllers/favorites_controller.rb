class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    topic = Topic.find(params[:topic_id])
    current_user.tryfavorite(topic)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    topic = Topic.find(params[:topic_id])
    current_user.unfavorite(topic)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end