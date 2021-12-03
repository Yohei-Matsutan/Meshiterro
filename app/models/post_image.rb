class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # user_idがfavoriteテーブル内に存在するかを返す(Viewで使う)
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image # refileのため
end
