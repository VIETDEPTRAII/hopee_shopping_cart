class StaticPagesController < ApplicationController
  def home
    if logged_in_shop?
      @product = current_shop.products.build
      @feed_items = current_shop.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
