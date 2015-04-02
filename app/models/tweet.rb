class Tweet < ActiveRecord::Base
  has_attached_file :image,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :body, presence: true, length: { maximum: 140 }

  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }

end
