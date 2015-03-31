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

end
