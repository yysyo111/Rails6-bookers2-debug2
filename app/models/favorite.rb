class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_uniqueness_of :book_id, scope: :user_id
end


# validates_uniqueness_of :book_id, scope: :user_id
# userは1つの投稿に対して１つしかいいねをつけられないようにするためにバリデーションを記述
# validates_uniqueness_ofによって属性の値が一意であることをバリデーションが成立
# scopeを使って、範囲を指定して、一意かどうかを判断