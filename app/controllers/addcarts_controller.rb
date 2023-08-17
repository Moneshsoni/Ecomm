class AddcartsController < ApplicationController
  
  def show
  end

  def new
    @product = Product.find params[:product_id]
    @addcart = Addcart.new
  end


  def create
    binding.pry
    @product = Product.find(params[:product_id])
    @addcart = @product.addcarts.create(addcart_params)
    redirect_to product_path(@product)
  end


  def show
  end
  private
    def addcart_params
      params.require(:addcart).permit(:quantity, :total_price)
    end
end