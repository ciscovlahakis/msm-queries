class MiscController < ApplicationController
  def homepage
    render({ :template => "misc_templates/home"})
  end
  def directors
    @directors = Director.all
    render({ :template => "misc_templates/directors"})
  end
  def show_director
    @director = Director.find(params[:id])
    @movies = @director.movies
    render({ :template => "misc_templates/show_director" })
  end
  def directors_youngest
    @youngest_director = Director.where.not(dob: nil).order(dob: :desc).first
    render({ :template => "misc_templates/directors/youngest"})
  end
  def directors_eldest
    @eldest_director = Director.where.not(dob: nil).order(dob: :asc).first
    render({ :template => "misc_templates/directors/eldest"})
  end
  def movies
    @movies = Movie.includes(:director).all
    render({ :template => "misc_templates/movies"})
  end
  def show_movie
    @movie = Movie.find(params[:id])
    render({ :template => "misc_templates/show_movie" })
  end
  def actors
    @actors = Actor.all
    render({ :template => "misc_templates/actors"})
  end
  def show_actor
    @actor = Actor.find(params[:id])
    @characters = @actor.characters.includes(:movie)
    # To collect all unique movies where the actor has a character
    @movies = @characters.map(&:movie).uniq
    render({ :template => "misc_templates/show_actor" })
  end
end
