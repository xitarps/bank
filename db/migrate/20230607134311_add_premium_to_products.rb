class AddPremiumToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :premium, :boolean, default: false
  end
end
