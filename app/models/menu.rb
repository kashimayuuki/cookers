class Menu < ApplicationRecord
  has_one_attached :image

  belongs_to :user, optional: true
  belongs_to :genre, optional: true

  has_many :favorites ,dependent: :destroy      # メニュー/お気に入り → 1:多
  has_many :comments ,dependent: :destroy
  has_many :tags ,dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :genre_id, presence: true
  validates :image, presence: true

  # 中間テーブル
  # has_many :menugenres
  # has_many :genres, through: :menugenres

  def favorites?(user)
   favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
