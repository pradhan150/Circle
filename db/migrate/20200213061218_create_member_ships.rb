class CreateMemberShips < ActiveRecord::Migration[6.0]
  def change
    create_table :member_ships do |t|
      t.string :role

      t.timestamps
    end
  end
end
