class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({ :template => "directors_template/index.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({:dob => nil }).order({ :dob => :asc })[0]
    render({ :template => "directors_template/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.where.not({:dob => nil }).order({ :dob => :desc })[0]
    render({ :template => "directors_template/youngest.html.erb"})
  end

  def director_details
    @id = params["an_id"]
    @director = Director.where({:id => @id })[0]
    @filmography = Movie.where({:director_id => @id})
    render({ :template => "directors_template/show.html.erb"})
  end
end
