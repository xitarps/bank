class AdministratorsController < ApplicationController

  def index
    
    @administrators = Administrator.all  
  end

  def new
    @administrator = Administrator.new
  end 

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to administrator_path, notice: 'Admini criado com sucesso.'
    else
      render :new
    end
  end




  private

  def administrator_params
    params.require(:administrator).permit(:name)
  end

end