class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # begore_validationコールバック。保存する前にメールアドレスの値を小文字に変換する。
  before_validation { email.downcase! }
end
