class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.string :name, null: false
      t.decimal :value, precision: 5 , scale: 2, null: false

      t.timestamps
    end
  end
end
