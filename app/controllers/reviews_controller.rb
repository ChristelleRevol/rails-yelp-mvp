class ReviewsController < ApplicationController
  before_action :set_restaurant

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.required(:review).permit(:content, :rating)
  end
end
