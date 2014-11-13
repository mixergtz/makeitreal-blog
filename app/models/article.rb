class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  scope :most_commented, -> { joins(:comments).group('articles.id').select('articles.*, count(*) count_all').order('count_all desc').limit(5) }

end
