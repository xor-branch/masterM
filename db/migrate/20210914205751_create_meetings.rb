class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :day
      t.time :start_at
      t.time :end_at
      t.integer :guest

      t.timestamps
    end
  end
end
