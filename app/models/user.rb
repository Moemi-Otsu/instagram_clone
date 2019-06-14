class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # before_validationコールバック。保存する前にメールアドレスの値を小文字に変換する。
  before_validation { email.downcase! }
  # has_secure_passwordメソッド:セキュアにハッシュ化したパスワードを、データベース内のpassword_digestというカラムに保存する
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # 多対多アソシエーションの設定
  has_many :likes, dependent: :destroy
end
