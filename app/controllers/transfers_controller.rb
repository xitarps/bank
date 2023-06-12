class TransfersController < ApplicationController
  before_action :authenticate_and_authorize!
  before_action :search_transfer, only: %i[show]

  def index
    @transfers = current_user.userable&.account&.transfers if current_user.userable_type == 'Customer'
    @transfers ||= Transfer.all
  end

  def show; end

  def new
    @receiver_cpf = params[:cpf] if params.fetch(:cpf, nil)
    @transfer = current_user.userable&.account&.transfers.new
  end

  def create
    @transfer = Transfer.new(transfer_params.merge({ sender_id: current_user.userable&.account.id }))

    if @transfer.save
      persist_contact
      return redirect_to @transfer

    end

    render :new
  end

  private

  def transfer_params
    @raw_params = params.require(:transfer).permit(:receiver_cpf, :amount)
    handle_cpf
  end

  def search_transfer
    @transfer = current_user.userable&.account&.transfers.find(params[:id]) if current_user.userable_type == 'Customer'
    @transfer ||= Transfer.find(params[:id])
  end

  def handle_cpf
    if @raw_params.fetch(:receiver_cpf, nil)
      @receiver = Account.joins(:customer).where(customer: { cpf: @raw_params[:receiver_cpf] })&.first
      @raw_params.tap do |param|
        param[:receiver_id] = @receiver&.id
        param.delete(:receiver_cpf)
      end
    end
  end

  def persist_contact
    save_contact = params[:transfer].fetch(:save_contact, nil)
    if !save_contact.to_i.zero? && @receiver != current_user.userable.account
      current_user.userable.contact_list.customers << @receiver.customer
    end
  end
end
