class HelpPost < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :help_comments, dependent: :destroy
  has_many :help_likes, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  attachment :post_image

  acts_as_taggable_on :tags

  def liked_by?(user)
    help_likes.where(user_id: user.id).exists?
  end
end
