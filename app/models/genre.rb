class Genre < ApplicationRecord
  has_many :equipments
  
  validates :equipment_genre, presence: true
  
end
