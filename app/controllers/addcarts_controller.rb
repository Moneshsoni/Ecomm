class AddcartsController < ApplicationController
  
  def index
    @addcarts = Addcart.all
  end

  def allcard
    @addcarts = Addcart.all
  end

  def show
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @addcart = @product.addcarts.create
    redirect_to product_addcart_path(params[:id]), notice: 'Product added to cart.'
  end

  def new
    @product = Product.find params[:product_id]
    @addcart = Addcart.new
  end

  def create
    @product = Product.find(params[:id])
    @addcart = @product.addcarts.create()

    redirect_to product_addcarts_path(@product), notice: 'Product added to cart.'
  end

  private
    def addcart_params
      params.require(:addcart).permit(:quantity, :total_price)
    end
end