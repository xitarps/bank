class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.decimal :amount, precision: 5 , scale: 2, default: 0.00
      t.integer :status, null: false, default: 5
      t.date :trade_date, null: false, default: DateTime.current
      t.references :sender, index: true, foreign_key: {to_table: :accounts}
      t.references :receiver, index: true, foreign_key: {to_table: :accounts}

      t.timestamps
    end
  end
end
