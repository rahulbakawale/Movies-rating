class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.integer :total_gross
      t.text :description
      t.datetime :released_on

      t.timestamps
    end
  end
end
