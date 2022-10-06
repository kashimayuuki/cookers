class Menu < ApplicationRecord
  has_one_attached :image
  
  # 中間テーブル
  has_many :menugenres
  has_many :genres, through: :menugenres
end
