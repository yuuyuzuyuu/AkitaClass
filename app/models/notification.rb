class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :help_post, optional: true #opinional: trueで、nilを許可
  belongs_to :want_post, optional: true
  belongs_to :help_comment, optional: true
  belongs_to :want_comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
