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
  has_many :users_publishers, dependent: :destroy
  accepts_attachments_for :publisher_images, attachment: :publisher_image
  #----------------------------------最初のモデルがモデル名----------カラムのid抜いた値----------------------------

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

# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーmatchの通知機能ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

def create_notification_matching!(current_user)
     temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーchatの通知機能ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
def create_notification_comment!(current_user, chatroom_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      publisher_id: id,
      chatroom_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end









