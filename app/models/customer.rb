class Customer < ApplicationRecord
  has_one :user, as: :userable, dependent: :nullify
  has_one :contact_list, dependent: :destroy
  has_one :account, dependent: :destroy

  has_many :customer_contact_lists, dependent: :destroy
  has_many :contact_lists, through: :customer_contact_lists

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cpf, presence: true

  after_create :create_contact_list
  after_create :create_account

  private

  def create_contact_list
    ContactList.create(customer: self)
  end

  def create_account
    Account.create(customer: self)
  end
end
