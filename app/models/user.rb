class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :group
  has_many :skill, dependent: :destroy
  has_many :work, dependent: :destroy
  has_many :hoby, dependent: :destroy
end
