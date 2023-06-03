class RemoveColumnReferencesAndAdministratorFromClassroom < ActiveRecord::Migration[7.0]
  def change
    remove_column :classrooms, :references
    remove_column :classrooms, :administrator
  end
end
