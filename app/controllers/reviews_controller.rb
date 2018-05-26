class ReviewsController < ApplicationController

 before_action(:current_user)

def create
  @product = params[:product_id]
  @review = current_user.reviews.new(
    product_id: @product,
    rating:review_params[:rating],
    description:review_params[:description]
  )
  @review.save

  if @review.save
    redirect_to product_path(@review.product)
  else
    redirect_to product_path(@product)
  end
end

def destroy
  @product = Product.find(params[:product_id])
  @review = @product.reviews.find{|x| x.id == params[:id].to_i}
  @review.destroy
  redirect_to product_path(@product)
end

private
def review_params
  params.require(:review).permit(:rating,:description)
end
end
