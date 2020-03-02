class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :group
  
  validates :message, length: { maximum: 100 }


  def self.bulk_create(receiver_ids, user, group_id)
    ActiveRecord::Base.transaction do
      receiver_ids.each do |invitation_receiver_id|
        user.sent_invitations.create!(
          receiver_id: invitation_receiver_id,
          group_id: group_id
        )
      end
    end
  end
end
