class AdministratorsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_administrator, only: [:show, :edit, :update, :destroy]

  def index
    @administrators = Administrator.all
  end

  def show; end

  def new
    @administrator = Administrator.new
  end

  def edit; end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      redirect_to administrators_path, notice: I18n.t('notices.administrator_created')
    else
      render :new
    end
  end

  def update
    return redirect_to administrators_path(@administrator) if @administrator.update(administrator_params)

    render :edit
  end

  def destroy
    @administrator.destroy

    redirect_to administrators_path
  end

  private

  def administrator_params
    params.require(:administrator).permit(:name)
  end

  def fetch_administrator
    @administrator = Administrator.find(params[:id])
  end
end
