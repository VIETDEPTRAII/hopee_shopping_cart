class CategoriesController < ApplicationController
  before_action :logged_in_shop, only: %i[index show new edit create update destroy]
  before_action :correct_shop,   only: %i[show edit update destroy]

  def index
    @categories = current_shop.categories.paginate(page: params[:page])
  end

  def show
    @category = current_shop.categories.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 8)
  end

  def new
    @category = current_shop.categories.build if logged_in_shop?
  end

  def create
    @category = current_shop.categories.build(category_params)
    if @category.save
      flash[:success] = 'Category created!'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = current_shop.categories.find(params[:id]) if logged_in_shop?
  end

  def update
    @category = current_shop.categories.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = 'Category updated!'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = current_shop.categories.find(params[:id])
    @category.destroy
    flash[:success] = 'Category deleted!'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def correct_shop
    @category = current_shop.categories.find_by(id: params[:id])
    redirect_to root_url if @category.nil?
  end
end
