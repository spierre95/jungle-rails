class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    puts('Cat new GET')
  end

  def show
    @product = Product.find params[:id]
  end

  def create

  end

end
