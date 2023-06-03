class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.string :couse, null: false
      t.string :references
      t.string :administrator

      t.timestamps
    end
  end
end
