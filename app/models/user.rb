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
  accepts_attachments_for :images,attachment: :image
  # 画像を複数枚受け付ける
end
