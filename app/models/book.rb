class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

# 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
# def favorited_by?(user)
#   favorites.where(user_id: user.id).exists?
# end