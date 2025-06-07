class Device < ApplicationRecord
  belongs_to :user

  validates :device_name, presence: true
  validates :device_type, presence: true
end
