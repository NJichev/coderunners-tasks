class ProductsController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html { @products }
      format.json { render json: @products }
    end
    
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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.users_id == current_user.id
        flash[:notice] = 'You cannot bid, since you are already in the lead.'
        render :edit
      else
      @product.users_id = current_user.id

      if @product.update_bid(bid_params)
        if @product.save
          render :show
        else
          flash[:notice] = 'Bid unsuccessful.'
          render :edit
        end
      else
        flash[:notice] = 'Bid must be atleast 10% higher than the last.'
        render :edit
      end
    end
  end

  private

  def bid_params
    params.require(:product)
          .permit(:current_bid)
  end

  def product_params
    params.require(:product)
          .permit(:name, :description,
                  :current_bid)
  end
end
