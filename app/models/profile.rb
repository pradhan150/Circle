class Profile < ApplicationRecord
  belongs_to :user

  validates :status, length: { maximum: 100 }
end
