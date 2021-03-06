class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  is_impressionable

  has_many :help_posts, dependent: :destroy
  has_many :want_posts, dependent: :destroy
  has_many :help_comments, dependent: :destroy
  has_many :want_comments, dependent: :destroy
  has_many :help_likes, dependent: :destroy
  has_many :want_likes, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :introduce, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, uniqueness: true
  attachment :profile_image
  validates :address, presence: true
  
  def active_for_authentication?
    super && (self.withdraw_status == false)
  end
  
end
