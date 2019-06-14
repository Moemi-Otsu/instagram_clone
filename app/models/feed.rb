class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  # 多対多アソシエーションの設定
  belongs_to :user
end
