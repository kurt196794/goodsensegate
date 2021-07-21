class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_product, except: [:index, :new, :create,]
  before_action :set_product_sold_blank?, only:[:edit,:update,:destroy]
  
  def index
    @products = Product.all.order("created_at DESC")
  end

  def update
    if  @product.update(product_params)
        redirect_to  product_path(@product)
   else
      render :edit
   end
 end

  def  new
    @product = Product.new
   end
  
   def edit
   end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
   @product.destroy
   redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:category_id,:smallcategory_id,:shipping_id,:delivery_area_id,:delivery_date_id,:price,:name,:description,:image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_sold_blank?
    redirect_to root_path unless current_user.id == @product.user_id && @Product.sold.blank?
  end

end
