class StaticPagesController < ApplicationController
  def home
    @categories = current_shop.categories.paginate(page: params[:page], per_page: 2) if logged_in_shop?
  end

  def help
  end

  def about
  end

  def contact
  end
end
