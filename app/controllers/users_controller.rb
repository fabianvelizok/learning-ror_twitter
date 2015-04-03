class UsersController < ApplicationController
  expose(:slug)  { params[:slug] }
  expose(:user)  { User.friendly.find(slug) }
  expose(:tweets){ user.tweets }
  expose(:users) { User.all }

  expose(:followed_users)        { user.followed_users }
  expose(:followed_users_count)  { user.followed_users_count }
  expose(:followers_users)       { user.followers_users }
  expose(:followers_users_count) { user.followers_users_count }

  def profile; end
  def index; end
  def followed; end
  def followers; end

  def in_my_profile?
    if current_user.slug == params[:slug]
      true
    else
      false
    end
  end

  helper_method :in_my_profile?
end
