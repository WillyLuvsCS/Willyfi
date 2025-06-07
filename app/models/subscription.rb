class Subscription < ApplicationRecord
  belongs_to :user

  validates :plan_type, presence: true
  validates :start_date, presence: true
end
