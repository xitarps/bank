class CreateContactLists < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_lists do |t|
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
