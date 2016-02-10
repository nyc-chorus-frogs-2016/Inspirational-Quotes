class Postquote < ActiveRecord::Base
	belongs_to :creator, foreign_key: :user_id
	has_many :comments

	validates :title, presence: true, uniqueness: true
	validates :content, presence: true, uniqueness: true
end