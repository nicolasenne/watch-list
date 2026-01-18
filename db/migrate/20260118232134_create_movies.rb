class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_url
      t.string :backdrop_url
      t.integer :release_year
      t.float :rating
      t.string :external_id

      t.timestamps
    end
  end
end
