class AccountsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_account, only: %i[show destroy]

  def index
    @accounts = Account.all
  end

  def show; end

  def destroy
    redirect_to accounts_path
  end

  private

  def fetch_account
    @account = current_user.userable.account if current_user.userable_type == 'Customer'
    @account ||= Account.find(params[:id])
  end
end
