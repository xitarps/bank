class ClassroomsController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :fetch_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = Classroom.all
  end

  def show; end

  def new
    @classroom = Classroom.new
  end

  def edit; end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to classrooms_path, notice: I18n.t('notices.classroom_created')
    else
      render :new
    end
  end

  def update
    return redirect_to classrooms_path(@classroom) if @classroom.update(classroom_params)

    render :edit
  end

  def destroy
    @classroom.destroy

    redirect_to classrooms_path
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :course)
  end

  def fetch_classroom
    @classroom = Classroom.find(params[:id])
  end
end
