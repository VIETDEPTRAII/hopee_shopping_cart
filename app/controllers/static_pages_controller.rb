class StaticPagesController < ApplicationController

  def home
    if logged_in_shop?
      @categories = current_shop.categories.all.paginate(page: params[:page],
                                                         per_page: 4)
    else
      @categories = Category.all.paginate(page: params[:page], per_page: 4)
    end
  end

  def help; end

  def about; end

  def contact; end
end
