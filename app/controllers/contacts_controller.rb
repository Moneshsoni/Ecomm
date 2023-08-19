class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: "Your message send to the Ecommerce!"
    else
      render :new
    end
  end

  def edit 
    @contact = Contact.find(@contact.id)
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :surname, :city, :email, :requirement)
  end
end
