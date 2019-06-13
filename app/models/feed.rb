class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :caption, presence: true
end
