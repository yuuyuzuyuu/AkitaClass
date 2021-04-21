class WantComment < ApplicationRecord
  belongs_to :user
  belongs_to :want_post

  validates :comment, presence: true
end
