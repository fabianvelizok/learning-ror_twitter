class Tweet < ActiveRecord::Base
  has_attached_file :image,
                    styles: {
                        medium: "300x300>",
                        thumb: "40x40#"
                    }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
                      
  belongs_to :user
end
