class CommentsController < ApplicationController
  expose(:tweet_id){ params[:id] }

  def create
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet_id

    if comment.save
      redirect_to tweet_path(tweet_id), notice: 'The comment has been created successfully'
    else
      redirect_to tweet_path(tweet_id), alert: 'An error has ocurred'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
