class ChangeColumnCouseToCourse < ActiveRecord::Migration[7.0]
  def change
    rename_column :classrooms, :couse, :course
  end
end
