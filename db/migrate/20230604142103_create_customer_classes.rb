class CreateCustomerClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_classes do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
