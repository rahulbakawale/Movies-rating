class AddColumnImageAndSpotToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :movie_images, :string, default: 'placeholder_image.jpg'
    add_column :movies, :spot, :integer
  end
end
