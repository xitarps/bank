class DepositsController < ApplicationController
  def new
    @deposit = Deposit.new
  end

  def create
    @accounts = Account.by_customer_id(deposit_params[:customer_id]) if deposit_params.fetch(:customer_id, nil)
    @accounts ||= Account.by_classroom_id( deposit_params[:classroom_id]) if deposit_params.fetch(:classroom_id, nil)

    @accounts = Account.deposit(accounts, deposit_params[:amount])

    if @accounts.map{|acc| acc.errors.empty? }.all?(true)
      redirect_to new_deposit_path, notice: I18n.t('notices.deposit_created')
    else
      render :new
    end
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :customer_id, :i)
  end
end
