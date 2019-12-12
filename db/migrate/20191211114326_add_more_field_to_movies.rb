class AddMoreFieldToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :cast, :string
    add_column :movies, :director, :string
    add_column :movies, :duration, :string
  end
end
