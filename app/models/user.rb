class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus
  has_many :favorites, dependent: :destroy     # ユーザー/お気に入り → 1:多
  has_many :comments

  enum is_valid: { '有効': true, '退会': false }


  # ゲストユーザー機能
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def active_for_authentication?
    super && (is_valid == '有効')
  end

end
