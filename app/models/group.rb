class Group < ApplicationRecord
  has_many :member_ships
  has_many :users, through: :member_ships

  validates :name, presence: true
end
