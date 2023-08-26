class UserApplication < ApplicationRecord
  has_many :user_application_details, dependent: :destroy
  has_many :equipments, through: :user_application_details
  belongs_to :user

  enum application_status: {applying:0, during_use:1, return_pending:2, returned:3}

  validates :objective,               presence: true
  validates :start_date,              presence: true
  validates :end_date,                presence: true
  validates :return_date,             presence: true
  validates :location,                presence: true
  validates :application_status,      presence: true
  
end