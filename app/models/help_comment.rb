class HelpComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :help_post
  
  validates :comment, presence: true
  
end
