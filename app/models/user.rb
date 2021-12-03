class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userが削除された時にその投稿も削除できる機能を添えて
  has_many :post_images, dependent: :destroy
end
