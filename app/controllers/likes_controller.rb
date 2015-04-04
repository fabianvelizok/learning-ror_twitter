class LikesController < ApplicationController
  before_action :authenticate_user!
  expose(:tweet_id){ params[:id] }

  def create
    if current_user.can_give_like?(tweet_id)
      like = current_user.likes.build(tweet_id: tweet_id)
      if like.save
        redirect_to root_path, notice: 'The like has been created successfully'
      end
    end
  end

  def destroy
    like = current_user.likes.where(tweet_id: tweet_id).first
    if like.destroy
      redirect_to root_path, notice: 'The like has been destroyed successfully'
    end
  end
end
