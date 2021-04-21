class Genre < ApplicationRecord
  has_many :help_posts
  has_many :want_posts

  validates :name, presence: true
end
