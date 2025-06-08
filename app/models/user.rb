class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :playlists, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
