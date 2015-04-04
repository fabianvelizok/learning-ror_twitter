class Tweet < ActiveRecord::Base
  has_attached_file :image,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :body, presence: true, length: { maximum: 140 }

  belongs_to :user

  has_many :likes
  has_many :users_like, through: :likes, source: :user

  scope :latest, -> { order(created_at: :desc) }

  def users_like_count
    users_like.count
  end

end
