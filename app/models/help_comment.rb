class HelpComment < ApplicationRecord
  belongs_to :user
  belongs_to :help_post
  
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
