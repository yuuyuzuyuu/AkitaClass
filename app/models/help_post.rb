class HelpPost < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  
  validates :title, presence: true
  validates :body, presence: true
  attachment :post_image

end
