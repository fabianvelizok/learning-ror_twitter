class LikesController < ApplicationController
  before_action :authenticate_user!
  expose(:tweet_id){ params[:tweet] }

  def create
    like = current_user.likes.build(tweet_id: tweet_id)
    if like.save
      redirect_to root_path, notice: 'The like has been created successfully'
    end
  end

  def destroy
  end
end
