class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.text :message
      t.integer :sender_id
      t.integer :receiver_id
      t.references :group, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
