class User < ApplicationRecord
  # Feedモデルのimageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
  # バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  # has_secure_passwordメソッド:セキュアにハッシュ化したパスワードを、データベース内のpassword_digestというカラムに保存する
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # 多対多アソシエーションの設定
  has_many :feeds
  has_many :likes, dependent: :destroy
end
