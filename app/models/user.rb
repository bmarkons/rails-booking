class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :accommodations, :dependent => :destroy
  has_many :room_reservations, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
