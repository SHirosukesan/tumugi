class Publisher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :publisher_images, dependent: :destroy
  has_many :matcher, class_name: "UsersPublisher", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :matched, class_name: "UsersPublisher", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :notifications, dependent: :destroy
  accepts_attachments_for :publisher_images,attachment: :publisher_image

  # ーーーーーーーーーーーーーーーーーーーーーーーーーfavorite機能ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
 def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
 end

 # ---------------------------------------match機能----------------------------------------------------------------
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

# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー通知機能ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

def create_notification_matching!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and publisher_id = ? and action = ? ", current_user.id, user_id, id, 'matching'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
end


