class ReviewsController < ApplicationController
  def index

    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews

  end

  def new
    # @restaurant for action in simple form
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
