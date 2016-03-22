class ProductsController < ApplicationController
  def index
    @products = Product.all

    render :index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product.id)
    else
      redirect_to new_product_path
    end
  end

  def show
    @products = Product.find(params[:id])
  end
end
