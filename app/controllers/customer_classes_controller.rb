class CustomerClassesController < ApplicationController
  before_action :fetch_customer_class, only: [:show, :edit, :update, :destroy]
  def index
    @customer_classes = CustomerClass.all
  end
  
  def new
    @customer_class = CustomerClass.new
    @customers = Customer.all
    @classrooms = Classroom.all
  end

  def edit 
    @customers = Customer.all
    @classrooms = Classroom.all
  end

  def create
    @customer_class = CustomerClass.new(customer_class_params)
    if @customer_class.save
      redirect_to customer_classes_path, notice: 'Usuário atrelado com sucesso.'
    else
      render :new
    end
  end

  def update
    return redirect_to customer_class_path(@customer_class) if @customer_class.update(customer_class_params)

    render :edit
  end

  def destroy
    @customer_class.destroy

    redirect_to customer_classes_path
  end
  private

  def customer_class_params
    params.require(:customer_class).permit(:customer_id, :classroom_id)
  end

  def fetch_customer_class
    @customer_class = CustomerClass.find(params[:id])
  end
end
