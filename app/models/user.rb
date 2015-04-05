class User < ActiveRecord::Base
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    styles: {
                        medium: "300x300>",
                        small: "200x200#",
                        thumb: "40x40#"
                    }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  friendly_id :user_name, use: :slugged

  has_many :tweets
  has_many :followings
  has_many :followed_users, through: :followings, source: :followed

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers_users, through: :followers, source: :user

  has_many :likes
  has_many :comments


  def followed_users_count
    followed_users.count
  end

  def followers_users_count
    followers_users.count
  end

  # This method is used in home#index to show the followed users' tweets and my tweets
  def followed_users_and_me
    followed_users + [id]
  end

  def can_give_like?(tweet_id)
    if likes.where(tweet_id: tweet_id).first
      false
    else
      true
    end
  end

  def can_follow?(slug_param)
    slug_by_user   = slug
    slug_by_params = slug_param

    if slug_by_user == slug_by_params || followed_users.all.map(&:slug).include?(slug_by_params)
      false
    else
      true
    end
  end

end
