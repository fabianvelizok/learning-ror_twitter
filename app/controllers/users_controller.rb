class UsersController < ApplicationController
  expose(:slug)  { params[:slug] }
  expose(:user)  { User.friendly.find(slug) }
  expose(:tweets){ user.tweets }

  def profile; end

  def in_my_profile?
    if current_user.slug == params[:slug]
      true
    else
      false
    end
  end

  helper_method :in_my_profile?
end
