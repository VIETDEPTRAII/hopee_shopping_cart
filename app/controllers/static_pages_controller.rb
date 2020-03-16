class StaticPagesController < ApplicationController
  def home
    @categories = Category.all.paginate(page: params[:page], per_page: 4)
  end

  def help
  end

  def about
  end

  def contact
  end
end
