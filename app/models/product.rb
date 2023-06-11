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
    filters[:minimum_amount] = minimum_amount_filter(params)
    filters[:premium] = premium_filter(params)
    filters[:final_date] = final_date_filter(params)
    filters[:tax_id] = index_filter(params)
    filters = nil if filters.empty?

    where(filters.compact)
  end

  def self.minimum_amount_filter(params)
    (params[:minimum_amount_filter].to_f..) if params.fetch(:minimum_amount_filter, nil)&.present?
  end

  def self.premium_filter(params)
    params[:premium_filter]&.reject(&:blank?) if params.fetch(:premium_filter, nil)&.reject(&:blank?)&.any?
  end

  def self.final_date_filter(params)
    (params[:final_date_filter]..) if params.fetch(:final_date_filter, nil)&.present?
  end

  def self.index_filter(params)
    params[:index_filter]&.reject(&:blank?) if params.fetch(:index_filter, nil)&.reject(&:blank?)&.any?
  end
end
