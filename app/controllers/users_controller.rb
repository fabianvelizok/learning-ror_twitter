class UsersController < ApplicationController
  before_action :authenticate_user!

  expose(:slug)  { params[:slug] }
  expose(:user)  { User.friendly.find(slug) }
  expose(:tweets){ user.tweets }

  def profile; end
end
