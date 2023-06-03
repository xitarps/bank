class AccountsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_account, only: %i[show edit update destroy]

  def index
    @accounts = Account.all
  end

  def show; end

  def edit; end

  def update
    return redirect_to account_path(@account) if @account.update(account_params)

    render :edit
  end

  def destroy
    # @account.destroy

    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:amount, :customer_id)
  end

  def fetch_account
    @account = current_user.userable.account if current_user.userable_type == 'Customer'
    @account ||= Account.find(params[:id])
  end
end
