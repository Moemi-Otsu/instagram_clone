class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  # 多対多アソシエーションの設定
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
