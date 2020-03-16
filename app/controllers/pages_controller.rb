class PagesController < ApplicationController

  def search_product_by_name
    if params[:search].blank?
      @results = Product.all.paginate(page: params[:page], per_page: 10)
    else
      @parameter = params[:search].downcase
      @results = Product.all.where('lower(name) LIKE :search',
                                   search: "%#{@parameter}%")
                        .paginate(page: params[:page], per_page: 10)
    end
  end
end
