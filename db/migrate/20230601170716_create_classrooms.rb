class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :couse
      t.string :references
      t.string :administrator

      t.timestamps
    end
  end
end
