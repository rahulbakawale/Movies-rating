class AddColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :admin_id, :integer
  end
end
