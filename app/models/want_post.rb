class WantPost < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :want_comments, dependent: :destroy
  has_many :want_likes, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  attachment :post_image
  
  def liked_by?(user)
    want_likes.where(user_id: user.id).exists?
  end
  
end
