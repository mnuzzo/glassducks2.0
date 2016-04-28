class ReviewsController < ApplicationController
  before_action :find_coop
  before_action :find_review, only: [:edit, :update, :destroy]
  def new
	@review = Review.new
  end

  def create
	@review = Review.new(review_params)
	@review.coop_id = @coop.id
	@review.user_id = current_user.id

	if @review.save
	  redirect_to coop_path(@coop)
	else
	  render 'new'
	end
  end

  def edit
  end

  def update
	if @review.update(review_params)
	  redirect_to coop_path(@coop)
	else
	  render 'edit'
	end
  end

  def destroy
	@review.destroy
	redirect_to coop_path(@coop)
  end

  private

	def review_params
	  params.require(:review).permit(:rating, :comment)
	end

	def find_coop
	  @coop = Coop.find(params[:coop_id])
	end

	def find_review
	  @review = Review.find(params[:id])
	end
end
