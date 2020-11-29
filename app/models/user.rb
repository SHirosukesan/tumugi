class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :images, dependent: :destroy
  has_many :users_publishers, dependent: :destroy
#--------------フォロー機能-------------------------------------------------------------------------------------------------------
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  # (つなげているfollowerキーワード　calass_name仮想的にfollowerをRelationshipに作っている。外部キーもここで作っている　　　)



  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォロー>している人
  # user.followinguserで全部出る？そのための決まり文句10行目を使うための
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
 #---------------------------------------UserPublisher-----------------------------------------------------------------------
  has_many :matcher, class_name: "UsersPublisher", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :matched, class_name: "UsersPublisher", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
#-------------------------------通信機能-------------------------------------------------------------------
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :users_publishers, dependent: :destroy
#-----------------------Dm機能-------------------------------------------------
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

#------------------------画像の埋め込み-------------------------------------------------------
  accepts_attachments_for :images,attachment: :image
  # 上　画像を複数枚受け付ける



  #------------------いいね機能----------------------------------------------------------------
  def favorited_by?(publisher)
    favorites.where(publisher_id:publisher.id).exists?
  end

  #--------------------------フォロー機能---------------------------------------------
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

  # -------------------------------------------退会user-----------------------------------------------------------------

  def active_for_authentication?
    super && (self.is_withdrawal == false)
  end
#---------------バリテーションモデル---------------------------------------------------------------------

#skosksoksoksokos
#skosksoksoksokos
##skosksoksoksokos
#skosksoksoksokos
#skosksoksoksokos
#----------------

#skosksoksoksokos
#--------------検索機能----------------------------------------------
  def self.search(search)
      if search
        User.where(['nickname LIKE ?', "%#{search}%"])
      else
        User.all
      end
    end
end
