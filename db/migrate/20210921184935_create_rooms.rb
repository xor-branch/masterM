class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
