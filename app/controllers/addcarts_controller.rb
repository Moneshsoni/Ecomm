class AddcartsController < ApplicationController
  
  def index
    @addcarts = Addcart.all
  end

  def allcard
    @addcarts = current_user.addcarts
  end

  def show
  end

  def add_quantity
    @add_cart = Addcart.find(params[:id])
    price = @add_cart.total_price
    @add_cart.update(quantity: @add_cart.quantity+1, total_price: @add_cart.total_price+price)
    
    redirect_to allcard_path
  end

  def remove_quantity 
    @add_cart = Addcart.find(params[:id])
    if @add_cart.quantity>1
      @add_cart.update(quantity: @add_cart.quantity-1, total_price: @add_cart.total_price-@add_cart.initial_product_price)
      redirect_to allcard_path
     else
      redirect_to allcard_path, notice: "Item not should be less than 1!"
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @addcart = current_user.addcarts.create(total_price:@product.price, initial_product_price:@product.price)
    redirect_to allcard_path, notice: 'Product added to cart Please see on your all cards page.'
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
      params.require(:addcart).permit(:quantity, :total_price, :initial_product_price)
    end
end

