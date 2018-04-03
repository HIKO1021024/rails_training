class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :name, presence: true, length: { maximum: 255 },uniqueness: true
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness: true
  #has_secure_password
  #validates :password, presence: true, length: { minimum: 6 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
end
