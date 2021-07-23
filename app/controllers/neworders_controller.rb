class NewordersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  def index
    @neworder = Neworder.new
  end


  def create
    @neworder = Neworder.new(neworder_params)
    if @neworder.valid?
       pay_item
       @neworder.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def neworder_params
    params.require(:neworder).permit(:postal_code,:delivery_area_id,:municipalities,:address,:building_name,:phone_number).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token] )
  end

  def set_item
    @product = Product.find(params[:product_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @product.user_id 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  
      card: neworder_params[:token],    
      currency: 'jpy'                 
    )
  end


end

