class ProductsController < ApplicationController
  
  def index
    @products = if current_user.user_type == "seller"
      current_user.products
    else
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true).page params[:page]
    end
  end

  def new
    @product = Product.new
  end

  def home
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page params[:page]
  end
  
  def create
    @product = current_user.products.create(product_params)
    redirect_to root_path
  end



  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
        redirect_to products_path, notice: "Product is succefully updated"
    else
        render :edit
    end
  end

  def destroy
    @prod = Product.find(params[:id])
    @prod.destroy
    redirect_to products_path, notice: "Product is successfully Deleted"
  end


  def welcome
  end

  def show
    @product = Product.find(params[:id])
  end

  def buy
  end

  def about
  end

  def like
    @product = Product.all.find(params[:id])
    Like.create(user_id: current_user.id, product_id: @product.id)
    redirect_to product_path(@product)
  end

  private


  def product_params
    params.require(:product).permit(:name, :catogery, :company, :description, :price, :image)
  end
  
end
