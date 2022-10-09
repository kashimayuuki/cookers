class Favorite < ApplicationRecord
  belongs_to :user   # ユーザー/お気に入り → 1:多
  belongs_to :menu   # メニュー/お気に入り    → 1:多
  
  validates_uniqueness_of :menu_id, scope: :user_id    # バリデーション（ユーザーとメニューの組み合わせは一意）
# 同じ投稿を複数回お気に入り登録させないため。
end
