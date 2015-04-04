class HomeController < ApplicationController
  expose(:tweets){ Tweet.where(user_id: current_user.followed_users_and_me).latest }
  def index; end
end
