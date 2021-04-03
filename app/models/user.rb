class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: true      
  validates :first_name, presence: true  
  validates :last_name_kana, presence: true       
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  attachment :profile_image
  
end
