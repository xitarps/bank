class DepositsController < ApplicationController
  before_action :fetch_accounts, only: :create
  def new; end

  def create
    errors = []
    errors << t('notices.blank_customer') if @accounts.empty?
    errors << t('notices.blank_value') if deposit_params.fetch(:amount, nil)&.empty?
    return redirect_to new_deposit_path, alert: errors if errors.any?

    @accounts = Account.deposit(@accounts, deposit_params[:amount].to_f)
    if @accounts.map { |acc| acc.errors.empty? }.all?(true)
      redirect_to new_deposit_path, notice: I18n.t('notices.deposit_created')
    else
      render :new
    end
  end

  private

  def deposit_params
    params.permit(:amount, :customer_id, :classroom_id)
  end

  def fetch_accounts
    @accounts = Account.by_customer_id(deposit_params[:customer_id]) if deposit_params.fetch(:customer_id, nil)
    @accounts = Account.by_classroom_id(deposit_params[:classroom_id]) if deposit_params.fetch(:classroom_id, nil)
  end
end
