class ProductsController < ApplicationController
  before_action :logged_in_shop, only: %i[index new edit create update destroy]
  before_action :correct_shop,   only: %i[edit update destroy]

  def index
    @products = current_shop.products.paginate(page: params[:page], per_page: 8)
  end

  def show
    @product = Product.find(params[:id])
    if logged_in_shop?
      @correct_product = current_shop.products.find_by(id: @product.id)
    end
  end

  def new
    if logged_in_shop?
      @product = current_shop.products.build
      @product_rating = @product.build_product_rating
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

  def product_params
    params.require(:product).permit(:name, :description, :price,
                                    :total, :picture, :category_ids,
                                    product_rating_attributes: %i[id product_id rating],)
  end
end
