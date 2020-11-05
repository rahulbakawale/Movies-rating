class AddColumnSlugToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :slug, :string
  end
end
