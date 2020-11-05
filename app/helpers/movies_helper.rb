module MoviesHelper

  
   def number_change(num)
    return number_to_currency(num)
   end

  
def more_like?(movie)
   like=movie.likes.find_by(user_id: current_user.id) 
      if like 
     link_to "Unlike " ,  movie_like_path(movie,like), method: :delete, class: 'btn btn-danger '
    else
       link_to "Like " ,  movie_likes_path(movie), method: :post, class: 'btn btn-primary '
    end
  end  

 

end
