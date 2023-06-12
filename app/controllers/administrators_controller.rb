class AdministratorsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_administrator, only: [:show, :edit, :update, :destroy]

  def index
    @administrators = Administrator.all
  end

  def show; end

  def new
    @administrator = Administrator.new
    @administrator.build_user
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
    if @administrator.update(administrator_params)
      return redirect_to administrators_path(@administrator), notice: t('.administrator_saved')
    end

    render :edit
  end

  def destroy
    @administrator.destroy

    redirect_to administrators_path, notice: t('.administrator_destroy')
  end

  private

  def administrator_params
    params.require(:administrator).permit(:name, user_attributes: %i[email password])
  end

  def fetch_administrator
    @administrator = Administrator.find(params[:id])
  end
end
