class ReviewsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @review = Review.new(review_params)
    @review.request = @request
    authorize @review
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
