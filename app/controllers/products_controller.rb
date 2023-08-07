class ProductsController < ApplicationController
  def index
    @products = if current_user.user_type == "seller"
      current_user.products
    else
      Product.all
    end
  end

  def new
    @product = Product.new
  end


  def home
    @products = Product.all
  end

  def create
    @product = current_user.products.create(product_params)
    redirect_to root_path
  end

  private


  def product_params
    params.require(:product).permit(:name, :catogery, :company, :description, :price, :image)
  end


end
