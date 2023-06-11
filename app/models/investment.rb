class Investment < ApplicationRecord
  belongs_to :account
  belongs_to :product

  validates :amount, presence: true
  validates :amount, numericality: true
  validate :investment_amount_greather_than_product_minimum_amount

  validate :purchase_allowed

  private

  def investment_amount_greather_than_product_minimum_amount
    if selected_product.nil? || amount.to_i < selected_product.minimum_amount
      errors.add(:amount, 'a investir deve ser maior')
    end
  end

  def selected_product
    Product.find_by(id: product)
  end

  def purchase_allowed
    errors.add(:account, 'mude para premium') if product.premium? && account.customer.classrooms.empty?
  end
end
