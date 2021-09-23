class AddVideoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :video, :string
  end
end
