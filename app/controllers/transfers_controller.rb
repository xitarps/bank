class TransfersController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :search_transfer, only: %i[show]

  def index
    @transfers = current_user.userable&.account&.transfers if current_user.userable_type == 'Customer'
    @transfers ||= Transfer.all
  end

  def show; end

  def new
    @transfer = current_user.userable&.account&.transfers.new
  end

  def create
    @transfer = Transfer.new(transfer_params.merge({ sender_id: current_user.userable&.account.id }))

    return redirect_to @transfer if @transfer.save

    render :new
  end

  private

  def transfer_params
    params.require(:transfer).permit(:receiver_id, :amount)
  end

  def search_transfer
    @transfer = current_user.userable&.account&.transfers.find(params[:id]) if current_user.userable_type == 'Customer'
    @transfer ||= Transfer.find(params[:id])
  end
end
