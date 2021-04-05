class WantPost < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :want_comments
  
end
