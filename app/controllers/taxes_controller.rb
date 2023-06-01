class TaxesController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :search_tax, only: [:show, :edit, :update, :destroy]

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

    render :index
  end

  def update
    return redirect_to taxes_path(@tax) if @tax.update(tax_params)

    render :edit
  end

  def destroy
    @tax.destroy

    redirect_to tax_path
  end

  private

  def tax_params
    params.require(:tax).permit(:name, :value)
  end

  def search_tax
    @tax = Tax.find(params[:id])
  end
end
