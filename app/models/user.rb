class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :member_ships, dependent: :destroy
  has_many :groups, through: :member_ships
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :invitation, dependent: :destroy

  validates :name, :email, :password, :date_of_birth, :mobile_number, :gender, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { in: 6..20 }
  validates :email, :mobile_number, uniqueness: true
  validate :age_must_be_greater_than_13

  def age_must_be_greater_than_13
    if Date.today.year - date_of_birth.year < 13
      errors.add(:date_of_birth, "age must be greater than or equal to 13")
    end
  end
end
