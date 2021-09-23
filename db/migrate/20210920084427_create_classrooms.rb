class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
