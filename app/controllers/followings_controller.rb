class FollowingsController < ApplicationController
  before_action :authenticate_user!
  expose(:slug){ params[:slug] }
  expose(:user){ User.friendly.find(slug) }

  def create
    if current_user.can_follow?(slug)
      following = current_user.followings.build(followed_id: user.id)
      @success = following.save
    end
  end

  def destroy
    following = current_user.followings.where(followed_id: user.id).first
    @success = following.destroy
  end
end
