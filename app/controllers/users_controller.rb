class UsersController < ApplicationController
  expose(:slug)  { params[:slug] }
  expose(:user)  { User.friendly.find(slug) }
  expose(:tweets){ user.tweets }

  def profile; end
end
