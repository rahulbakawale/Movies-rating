class CangheColumnImageToMovies < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :movie_images, :movie_image
  end
end
