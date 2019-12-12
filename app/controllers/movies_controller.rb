class MoviesController < ApplicationController
  before_action :find_movie,only: [:show,:edit,:update,:destroy]
  
  def index
    @movies=Movie.upcoming
  end

   def show
   end 
   
   def edit
    end
   
  def update
    if @movie.update(movie_params)
    redirect_to movie_path(@movie), notice: 'Movie has successfully updated!'
  else
     flash.now[:errors]="Some Errors !"
     render :edit
   end
  end


 def new
     @movie =  Movie.new()
    end

 def create
    @movie=Movie.new(movie_params)
    if @movie.save
       redirect_to movie_path(@movie), notice: 'Movie has successfully create'
    else
      flash.now[:errors]="Some Errors !"
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
     params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on,:movie_image,:spot, :cast, :director, :duration)
  end
end
