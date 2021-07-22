class TimelinesController < ApplicationController
   before_action :require_user_logged_in
  def index
    if params[:keyword].blank?
      @ranking = Topic.find(Favorite.group(:topic_id).order('count(topic_id) DESC').limit(3).pluck(:topic_id))
      #@ranking = Topic.includes(:fovorited).sort {|a,b| b.fovorited.size <=> a.fovorited.size}
      @pagy, @topics = pagy(Topic.order(id: :desc))
    else
      @ranking = Topic.find(Favorite.group(:topic_id).order('count(topic_id) DESC').limit(3).pluck(:topic_id))
      @pagy, @topics = pagy(Topic.search(params[:keyword]).order(id: :desc))
    end
  end
  
  
  #def search
    #@keyword = params[:keyword]
    #@pagy, @topics = pagy(Topic.order(id: :desc))
    #@pagy,@topics = pagy(Topic.search(params[:keyword]).order(id: :desc))
    #render :index
  #end
end
