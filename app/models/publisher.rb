class Publisher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :matcher, class_name: "UsersPublisher", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :matched, class_name: "UsersPublisher", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

 def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
 end
 # ユーザーがpublisherにマッチを送る     ↓userがmachしたいと送ってあげてる。、publisher逆になる
  def match(user_id,publisher_id,follower_permission)
    p publisher_id
    p user_id
    if UsersPublisher.already_sent_matched?(user_id,publisher_id)
      matcher.update(follower_id: publisher_id,followed_id: user_id,followed_permission:follower_permission)
    else
      matcher.create!(follower_id: publisher_id,followed_id: user_id,followed_permission:follower_permission)
    end
  end

  # ユーザーのフォローを外す
  def unmatch(user_id,publisher_id)
    matcher.find_by(follower_id: user_id,followed_id:publisher_id).destroy
  end
end
