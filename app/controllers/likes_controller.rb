class LikesController < ApplicationController
  before_action :require_singin 
  before_action :find_movie , only: [:create, :destroy]
  
  def create
     like = @movie.likes.new(user_id: current_user.id)
   if like.save
       redirect_to movies_path, notice: 'Like has successfully '
    end 
  end
 
  def destroy
    like = @movie.likes.find(params[:id])
    like.destroy
    redirect_to movies_path, notice: 'Dis-like!'
  end
  
  private 
  def find_movie
     @movie=Movie.find(params[:movie_id])
  end

  
end



