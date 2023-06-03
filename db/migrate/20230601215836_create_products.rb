class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 255
      t.date :start_date, null: false
      t.date :final_date, null: false
      t.decimal :minimum_amount, null: false
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
