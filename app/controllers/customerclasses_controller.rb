class CustomerclassesController < ApplicationController
  def new
    @customer_class = CustomerClass.new
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

  private

  def customer_class_params
    params.require(:customer_class).permit(:customer_id, :class_id)
  end
end
