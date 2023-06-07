class Investment < ApplicationRecord
  belongs_to :account
  belongs_to :product

  validates :amount, presence: true
  validates :amount, numericality: true
  validate :investment_amount_greather_than_product_minimum_amount

  private

  def investment_amount_greather_than_product_minimum_amount
    selected_product = Product.find_by(id: product)
    if selected_product.nil? || amount.to_i < selected_product.minimum_amount
      errors.add(:amount, 'a investir deve ser maior')
    end
  end
end
