class ContactListsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fecth_contact_list
  before_action :fetch_customer, only: :destroy

  def show; end

  def destroy
    message = t('.removed')
    redirect_to contact_list_path(current_user.userable), notice: message if @contact_list.customers.delete(@customer)
  end

  private

  def fetch_customer
    @customer = current_user.userable.contact_list.customers.find(params[:id])
  end

  def fecth_contact_list
    @contact_list = ContactList.includes(:customers)
                               .where(customer: current_user.userable).first
  end
end
