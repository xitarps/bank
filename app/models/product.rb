class Product < ApplicationRecord
  belongs_to :tax
  has_many :investments, dependent: :nullify
  has_many :accounts, through: :investments

  validates :name, presence: true
  validates :start_date, presence: true
  validates :final_date, presence: true
  validates :minimum_amount, presence: true
  validates :minimum_amount, numericality: { greater_than_or_equal_to: 1 }

  def self.filter(params)
    filters = {}
    filters[:minimum_amount] = (params[:minimum_amount_filter].to_f..) if params.fetch(:minimum_amount_filter,
                                                                                       nil)&.present?
    filters[:premium] = params[:premium_filter]&.reject(&:blank?) if params.fetch(:premium_filter,
                                                                                  nil)&.reject(&:blank?)&.any?
    filters[:final_date] = (params[:final_date_filter]..) if params.fetch(:final_date_filter, nil)&.present?
    filters[:tax_id] = params[:index_filter]&.reject(&:blank?) if params.fetch(:index_filter,
                                                                               nil)&.reject(&:blank?)&.any?
    filters = nil if filters.empty?

    where(filters)
  end
end
