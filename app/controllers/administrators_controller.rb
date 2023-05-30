class AdministratorsController < ApplicationController
  before_action :fetch_administrator, only:[:show, :edit, :update, :destroy]
  def index
    
    @administrators = Administrator.all  
  end

  def new
    @administrator = Administrator.new
  end 

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to administrators_path, notice: 'Administrador criado com sucesso.'
    else
      render :new
    end
  end

  def show
    
    @administrator = Administrator.find(params[:id])
  
  end




  private

  def administrator_params
    params.require(:administrator).permit(:name)
  end

  def fetch_administrator
    @administrator = Administrator.find(params[:id])
  end

end