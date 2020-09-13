class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :group,optional:true
  has_many :skills, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :hobies, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォロー>している人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :matcher, class_name: "UsersPublisher", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :matched, class_name: "UsersPublisher", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  accepts_attachments_for :images,attachment: :image
  # 画像を複数枚受け付ける
  def favorited_by?(publisher)
    favorites.where(publisher_id:publisher.id).exists?
  end
   # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
  # --------------------------match機能---------------------------------------
# ユーザーがpublisherにマッチを送る     ↓userがmachしたいと送ってあげてる。、publisher逆になる
  def match(user_id,publisher_id,follower_permission)
    if UsersPublisher.already_sent_matched?(user_id,publisher_id)
      matcher.update(follower_id: user_id,followed_id: publisher_id,follower_permission:follower_permission)
    else
      matcher.create(follower_id: user_id,followed_id: publisher_id,follower_permission:follower_permission)
    end
  end

  # ユーザーのフォローを外す
  def unmatch(user_id,publisher_id)
    matcher.find_by(follower_id: user_id,followed_id:publisher_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
