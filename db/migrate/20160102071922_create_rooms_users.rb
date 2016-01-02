class CreateRoomsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms_users do |t|
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
