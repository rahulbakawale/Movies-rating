class MoviesController < ApplicationController
  before_action :find_movie,only: [:show,:edit,:update,:destroy]
  before_action :require_singin , except: [:index, :show]
 
  def index
   case params[:filter]
   when "upcoming"
    @movies =Movie.upcoming
  when "past"
    @movies=Movie.past
  when "recent"
    @movies=Movie.recent
  else
    @movies=Movie.all
  end
end

   def show
    @users=@movie.likers
    @categories = @movie.categories
   end 
   
   def edit
    end
   
  def update
    if @movie.update(movie_params)
      
    redirect_to movie_path(@movie), notice: 'Movie has successfully updated!'
  else
     flash.now[:error]="Some Errors !"
     render :edit
   end
  end


 def new
     @movie =  Movie.new()
    end

 def create
    @movie=Movie.new(movie_params)
    @movie.admin_id=current_user.id
    if @movie.save
       redirect_to movie_path(@movie), notice: 'Movie has successfully create'
    else
      flash.now[:error]="Some Errors !"
       render :new
    end    
  end


  def destroy
   @movie.destroy
   redirect_to movies_path,notice: 'Movie has successfully delete!'
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
     params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on,:movie_image,:spot, :cast, :director, :duration ,category_ids: [])
  end
end
