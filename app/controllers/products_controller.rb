class ProductsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :search_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end
  
  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    return redirect_to products_path if @product.save

    render :new
  end

  def update
    return redirect_to products_path(@product) if @product.update(product_params)

    render :edit
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :start_date, :final_date, :minimum_amount, :tax_id)
  end

  def search_product
    @product = Product.find(params[:id])
  end
end
