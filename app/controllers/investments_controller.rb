class InvestmentsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_investment, only: %i[show edit update destroy]

  def index
    @investments = current_user.userable.account&.investments if current_user.userable_type == 'Customer'
    @investments ||= Investment.all
  end

  def show; end

  def new
    @investment = Investment.new
  end

  def edit; end

  def create
    @investment = current_user.userable.account.investments.new(investment_params)

    return redirect_to investments_path, notice: t('.investment_create') if @investment.save

    render :new
  end

  def update
    if @investment.update(investment_params)
      return redirect_to investments_path(@investment),
                         notice: t('.investment_update')
    end

    render :edit
  end

  def destroy
    @investment.destroy

    redirect_to investments_path, notice: t('.investment_destroy')
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :product_id, :account_id)
  end

  def fetch_investment
    if current_user.userable_type == 'Customer'
      @investment = current_user.userable.account.investments.find(params[:id])
    end
    @investment ||= Investment.find(params[:id])
  end
end
