class Genre < ApplicationRecord
  # 中間テーブル
  # has_many :menugenres
  has_many :menus #through: :menugenres
end
