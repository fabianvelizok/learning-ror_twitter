class HomeController < ApplicationController
  expose(:tweets){ Tweet.where(user_id: current_user.followeds_and_me).latest }

  def index;  end
end
