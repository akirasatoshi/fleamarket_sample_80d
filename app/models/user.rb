class User < ApplicationRecord
  # Include default devise modules. Others available are: ベーシック認証のため残します。
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, maximum: 128}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :birth_day, presence: true
  has_one :address
  has_one :credit_card
  has_many :items

end 
