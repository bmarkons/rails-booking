class Accommodation < ApplicationRecord
  belongs_to :place
  belongs_to :user
  belongs_to :accommodation_type

  has_many :rooms, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  scope :approved, -> { where(approved: true) }

  def self.managed_by(manager)
    Accommodation.where(user: manager)
  end
end
