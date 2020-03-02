class MemberShip < ApplicationRecord
  belongs_to :user
  belongs_to :group
  ROLES = {
    admin: 'admin'  
  }.freeze
  


  def admin?
    role == ROLES[:admin]
  end
end
