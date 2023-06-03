class InvestmentsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_investments, only: %i[show edit update destroy]
  def index
    @investments = Investment.all
  end

  def show;  end

  def new
    @investment = investment.new
  end

  def edit; end

  def create
    @investment = investment.new(investment_params)

    return redirect_to investments_path if @investment.save

    render :new
  end

  def update
    return redirect_to investments_path(@investment) if @investment.update(investment_params)

    render :edit
  end

  def destroy
    @investment.destroy

    redirect_to investments_path, notice: t('.investment_destroy')
  end

  private

  def fetch_investments
    @investment = Investment.find(params[:id])
  end
end

