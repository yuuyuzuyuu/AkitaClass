class Genre < ApplicationRecord
  
  has_many :help_posts
  
  validates :name, presence: true
  
end
