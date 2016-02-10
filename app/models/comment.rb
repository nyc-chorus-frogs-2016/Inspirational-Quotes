class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :postquote
	validates :content, presence: true, uniqueness: true
	validates :user_id, presence: true
	validates :postquote_id, presence: true
end