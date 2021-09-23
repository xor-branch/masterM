class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.string :video
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
