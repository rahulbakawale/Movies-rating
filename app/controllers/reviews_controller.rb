class ReviewsController < ApplicationController
  before_action :set_movie
  before_action  :check_review_abl, only: [:new]
  
  def index
    @reviews=@movie.reviews
  end

  def new 
   @review=@movie.reviews.new
  end

  def create
   @review=@movie.reviews.new(review_params)
    if (@review.save)
      flash[:notice]="Your Review successfully Insert "
      redirect_to movie_reviews_path(@movie)
     else
      render :new 
   end
  end 

  private

  def review_params
    params.require(:review).permit(:name,:stars,:comment)
   end
   
   def set_movie
    @movie=Movie.find(params[:movie_id]) 
  end

   def check_review_abl
    if @movie.sold_out?
      flash[:errors] ="No more review "
      redirect_to movie_path(@movie) and return
     end 
   end
end  




