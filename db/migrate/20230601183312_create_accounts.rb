class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.decimal :amount, null: false, precision: 5 , scale: 2, default: 0.00
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
