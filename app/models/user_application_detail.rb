class UserApplicationDetail < ApplicationRecord
  belongs_to :user_application
  belongs_to :equipment
  
  has_one_attached :image
end
