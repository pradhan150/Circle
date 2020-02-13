class CreateMemberShips < ActiveRecord::Migration[6.0]
  def change
    create_table :member_ships do |t|
      t.string :role
      t.references :users, null: false, foreign_key: true
      t.references :groups, null: false, foreign_key: true

      t.timestamps
    end
  end
end
