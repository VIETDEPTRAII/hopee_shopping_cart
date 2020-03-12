class ProductsController < ApplicationController
  before_action :logged_in_shop, only: %i[index show new edit create update destroy]
  before_action :correct_shop,   only: %i[show edit update destroy]

  def index
    @products = current_shop.products.paginate(page: params[:page])
  end

  def show
    @product = current_shop.products.find(params[:id])
  end

  def new
    if logged_in_shop?
      @product = current_shop.products.build
    end
  end

  def create
    @product = current_shop.products.build(product_params)
    if @product.save
      flash[:success] = "Product created!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    if logged_in_shop?
      @product = current_shop.products.find(params[:id])
    end
  end

  def update
    @product = current_shop.products.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated."
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "product deleted"
    redirect_to products_path
  end

  private

  def correct_shop
    @product = current_shop.products.find_by(id: params[:id])
    redirect_to root_url if @product.nil?
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price,
                                    :total, :picture)
  end
end
