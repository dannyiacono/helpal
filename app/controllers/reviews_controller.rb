class ReviewsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @review = Review.new(review_params)
    @review.request = @request
    authorize @review
    if @review.save
      redirect_to :create
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
