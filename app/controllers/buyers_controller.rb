class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    gon.public_key=ENV["PAYJP_PUBLIC_KEY"]
    @buyer_address = BuyerAddress.new
    @item=Item.find(params[:item_id])
  end

  def new
    @item=Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item=Item.find(params[:item_id])
    @buyer_address=BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postcode, :region_id, :local, :house_number,:building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,   
      card: buyer_params[:token],  
      currency: 'jpy'              
    )
  end

end
