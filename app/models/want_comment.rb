class WantComment < ApplicationRecord
  belongs_to :user
  belongs_to :want_post
  
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
