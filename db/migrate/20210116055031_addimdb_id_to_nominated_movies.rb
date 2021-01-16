class AddimdbIdToNominatedMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :nominated_movies, :imdbID, :string
  end
end
