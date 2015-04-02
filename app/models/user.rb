class User < ActiveRecord::Base
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  friendly_id :user_name, use: :slugged

  has_many :tweets
  has_many :followings

  has_many :followeds, through: :followings, source: :followed

  # This method is used in photos#index to show photos of the followed users and mine
  def followeds_and_me
    followeds + [id]
  end

  def can_follow?(slug_param)
    slug_by_user   = slug
    slug_by_params = slug_param

    if slug_by_user == slug_by_params || followeds.all.map(&:slug).include?(slug_by_params)
      false
    else
      true
    end
  end

end
