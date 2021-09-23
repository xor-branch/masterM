class AddAdvisorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :advisor, :boolean, default: false
  end
end
