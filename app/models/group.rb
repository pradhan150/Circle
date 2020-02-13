class Group < ApplicationRecord
  has_many :member_ships, dependent: :destroy
  has_many :users, through: :member_ships

  validates :name, presence: true
end
