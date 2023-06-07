class TaxesController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_tax, only: %i[show edit update destroy]

  def index
    @taxes = Tax.all
  end

  def show; end

  def new
    @tax = Tax.new
  end

  def edit; end

  def create
    @tax = Tax.new(tax_params)

    return redirect_to taxes_path if @tax.save

    render :new
  end

  def update
    return redirect_to tax_path(@tax) if @tax.update(tax_params)

    render :edit
  end

  def destroy
    @tax.destroy

    redirect_to taxes_path, notice: t('.tax_destroy')
  end

  private

  def tax_params
    params.require(:tax).permit(:name, :value)
  end

  def fetch_tax
    @tax = Tax.find(params[:id])
  end
end
