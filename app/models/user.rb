class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :help_posts, dependent: :destroy
  has_many :want_posts, dependent: :destroy
  has_many :help_comments, dependent: :destroy
  has_many :want_comments, dependent: :destroy
  has_many :help_likes, dependent: :destroy
  has_many :want_likes, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  attachment :profile_image
  
end
