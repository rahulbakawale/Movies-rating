module LikesHelper

  def more_like?(movie)
    if movie.likes.user_id == current_user.id  && current_user 
      link_to "Unlike " ,  movie_likes_path(movie), method: :delete, class: 'btn btn-danger '
        else
      link_to "Like " ,  movie_likes_path(movie), method: :post, class: 'btn btn-primary '
    end
   end  
end
