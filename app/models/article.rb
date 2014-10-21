class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}

	# scope :most_commented, ->{ where(article.comments.count) }
end
