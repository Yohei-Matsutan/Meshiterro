class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # refileのため
end
