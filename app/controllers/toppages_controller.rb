class ToppagesController < ApplicationController
 def index
    if logged_in?
      @topic = current_user.topics.build  # form_with 用
      @pagy, @topics = pagy(current_user.topics.order(id: :desc))
    end
 end
end