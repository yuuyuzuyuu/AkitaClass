class WantLike < ApplicationRecord
    
  belongs_to :user
  belongs_to :want_post
  
end
