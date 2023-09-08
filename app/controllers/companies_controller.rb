class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @companies = Companie.all
  end

  def new
    @companie = Companie.new
  end

  def create
    @companie = Companie.new(companie_params)
    if @companie.save
      redirect_to companies_path, notice: "Companie created successfully"
    else
      render :new
    end
  end

  def edit
    @companie = Companie.find(params[:id])
  end

  def update
    @companie = Companie.find(params[:id])
    if @companie.update(companie_params)
      redirect_to companies_path, notice: "Companie updated successfully"
    else
      render :edit
    end
  end

  def show
    @companie = Companie.find(params[:id])
  end

  private
  def companie_params
    params.require(:companie).permit(:name, :catogery, :city, :country, :owner)
  end 
end
