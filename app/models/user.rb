class User < ApplicationRecord
  has_many :playlists, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end
