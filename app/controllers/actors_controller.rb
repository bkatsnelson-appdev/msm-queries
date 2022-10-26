class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
    render({ :template => "actors_template/index.html.erb"})
  end

  def actor_details
    @id = params["an_id"]
    @actor = Actor.where({:id => @id })[0]
    @character = Character.where({:actor_id => @id})
    #@filmography = Movie.where({:actor_id => @id})
    render({ :template => "actors_template/act_details.html.erb"})
  end
end
