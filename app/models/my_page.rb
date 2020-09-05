class MyPage < ApplicationRecordｃ
	belongs_to :group
	has_many :skill, dependent: :destroy
	has_many :work, dependent: :destroy
	has_many :hoby, dependent: :destroy
end
