class TweetsController < ApplicationController
  expose(:tweet)         { Tweet.find(params[:id]) }
  expose(:users_like)    { tweet.users_like }
  expose(:comment)       { Comment.new }
  expose(:comments)      { tweet.comments.includes(:user).all }
  expose(:comments_count){ tweet.comments.count }

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: 'The tweet has been created successfully'
    else
      render :new, alert: 'An error has ocurred'
    end
  end

  def show; end
  def likes; end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

end
