class CreateNominatedMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :nominated_movies do |t|
      t.string :title
      t.string :year
      t.string :poster

      t.timestamps
    end
  end
end
