class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_applications, dependent: :destroy
  has_many :cart_equipments, dependent: :destroy
  
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :employee_number,         presence: true
  validates :affiliation,             presence: true
  validates :phone_number,            presence: true
  
end
