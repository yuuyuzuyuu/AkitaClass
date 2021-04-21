class WantPost < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :town
  has_many :want_comments, dependent: :destroy
  has_many :want_likes, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  attachment :post_image

  acts_as_taggable_on :tags

  def liked_by?(user)
    want_likes.where(user_id: user.id).exists?
  end
end
