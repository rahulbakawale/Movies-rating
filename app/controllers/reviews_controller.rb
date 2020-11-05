class ReviewsController < ApplicationController
  before_action  :set_movie
  before_action  :check_review_abl, only: [:new]
  before_action  :require_singin
  before_action  :more_review?, only: [:new]
  def index
     @reviews=@movie.reviews
  end

  def new 
   @review=@movie.reviews.new
  end

  def show
   
  end

  def create
   @review=@movie.reviews.new(review_params)
   @review.user_id = current_user.id
    if  @review.save
      flash[:notice]="Your Review successfully Insert "
      redirect_to movie_reviews_path(@movie)
    end
  end 

  private

  def review_params
    params.require(:review).permit(:stars,:comment,:user_id)
   end
   
   def set_movie
    @movie=Movie.find(params[:movie_id]) 
  end

   def check_review_abl
     if @movie.sold_out?
       flash[:error] ="No more review "
      redirect_to movie_path(@movie) and return
     end 
   end

    def require_singin
    unless current_user
      session[:desired_url]=request.url
     flash[:error]="Please First Loin"
     redirect_to new_session_path
    end
    end 
      
     def more_review?
    @movie.reviews.each do |re|
        if re.user_id == current_user.id
          #binding.pry
          flash[:notice] = 'Max Only one Review'
          redirect_to movie_reviews_path(@movie)
         end
       end   
    end

end  




