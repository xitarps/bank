class CreateCustomerContactLists < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_contact_lists do |t|
      t.references :contact_list, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
