class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  scope :managed_by, -> (manager) { where(accommodation: { user: manager }) }
  scope :posted_by, -> (user) { where(user: user) }
end
