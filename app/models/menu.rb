class Menu < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  
  has_many :favorites ,dependent: :destroy
  has_many :comments ,dependent: :destroy
  
  # 中間テーブル
  has_many :menugenres
  has_many :genres, through: :menugenres
  
end
