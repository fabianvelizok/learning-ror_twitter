class FollowingsController < ApplicationController
  before_action :authenticate_user!
  expose(:slug){ params[:slug] }
  expose(:user){ User.friendly.find(slug)}

  def create
    following = current_user.followings.build(followed_id: user.id)
    if following.save
      redirect_to user_profile_path(slug), notice: 'The following has been created successfully'
    else
      redirect_to user_profile_path(slug), alert: 'An unexpected error has occurred'
    end
  end

  def destroy
  end
end
