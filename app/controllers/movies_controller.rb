class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all
    render({ :template => "movies_template/index.html.erb"})
  end

  def movie_details
    @id = params["an_id"]
    @movie = Movie.where({:id => @id })[0]
    @filmography = Director.where({:movie_id => @id})
    render({ :template => "movies_template/details.html.erb"})
  end
end
