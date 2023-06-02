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
    if @tax.save
      redirect_to taxes_path, notice: 'Nova taxa criada.'
    else
      render :new
    end
  end

  def update
    if @tax.update(tax_params)
      redirect_to taxes_path, notice: 'Taxa atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @tax.destroy

    redirect_to taxes_path, notice: 'Taxa Apagada com sucesso.'
  end

  private

  def tax_params
    params.require(:tax).permit(:name, :value)
  end

  def search_tax
    @tax = Tax.find(params[:id])
  end
end
