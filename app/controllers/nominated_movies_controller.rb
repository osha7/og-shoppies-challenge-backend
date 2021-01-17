class NominatedMoviesController < ApplicationController
    
    def index 
        nominated_movies = NominatedMovie.all
        render json: {
            nominated_movies: nominated_movies
        }
    end

    def new
    end

    def create_or_ignore_movie
        nominated_movie = NominatedMovie.find_or_create_by(imdbID: params["imdbID"])
        nominated_movie.title = params["Title"]
        nominated_movie.year = params["Year"]
        nominated_movie.poster = params["Poster"]
        
        nominated_movie.save
        # byebug
        if nominated_movie.valid? 
            render json: nominated_movie
        else
            render json: {error: "Unable to nominate movie at this time."}
        end
    end

    def destroy
        # byebug
        nominated_movie = NominatedMovie.find_by(id: params["id"])
        if nominated_movie.destroy
        # render json: {}, status: 200
            render status: :ok, json: { notice: 'Successfully deleted nomination.' }
        else
            render status: :unprocessable_entity, json: { error: 'Unable to delete nomination at this time.' }
        end
    end

    private
    
    def nominated_movies_params
        params.require(:nominated_movies).permit(:title, :year, :poster, :imdbID)
    end

end
