class Town < ApplicationRecord
    
  has_many :want_posts
  
  validates :name, presence: true
  
end
