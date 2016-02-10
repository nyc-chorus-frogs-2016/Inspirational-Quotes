class User < ActiveRecord::Base
	has_secure_password
	before_save :default_values
	has_many :comments
	has_many :postquotes
	validates :username, presence: true, uniqueness: true


	private
	def update_upvote_total
		self.upvote_total = self.comments.upvotes + self.quoteposts.upvotes
	end

	def default_values 
		self.upvote_total = 0
	end
end