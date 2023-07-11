class Equipment < ApplicationRecord
  has_many :cart_equipments, dependent: :destroy
  has_many :user_application_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  enum equipment_status: {available:0, during_use:1, unavailable:2, in_failure:3, under_maintenance:4}

  validates :equipment_name,           presence: true
  validates :management_number,        presence: true
  validates :administrator,            presence: true

end