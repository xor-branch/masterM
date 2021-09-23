class AddCategoryToClassrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :classrooms, :category, :integer
  end
end
