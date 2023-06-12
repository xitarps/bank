class ProductsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_product, only: %i[show edit update destroy]
  before_action :products_with_filter, only: :index

  def index; end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    return redirect_to products_path, notice: t('.product_saved') if @product.save

    render :new
  end

  def update
    return redirect_to products_path(@product), notice: t('.product_saved') if @product.update(product_params)

    render :edit
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: t('.product_destroy')
  end

  private

  def products_with_filter
    @products = Product.filter(filter_params)
  end

  def filter_params
    params.permit(:minimum_amount_filter, :final_date_filter, premium_filter: [], index_filter: [])
  end

  def product_params
    params.require(:product).permit(:name, :start_date, :final_date, :minimum_amount, :premium, :tax_id)
  end

  def fetch_product
    @product = Product.find(params[:id])
  end
end
