class MakeMovieAndUserinJoinTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :name, :string
     add_column :reviews, :user_id, :integer
    end
end

