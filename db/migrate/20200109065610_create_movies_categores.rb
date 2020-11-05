class CreateMoviesCategores < ActiveRecord::Migration[6.0]
  def change
    create_table :movies_categores do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
