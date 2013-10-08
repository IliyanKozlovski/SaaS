class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @all_ratings = Movie.ratings
    @visible_ratings = params[:ratings] || session[:ratings] || Hash[@all_ratings.map {|key| [key, 1]}] 

    sort = params[:sort] || session[:sort]

    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @visible_ratings
      redirect_to :sort => session[:sort], :ratings => session[:ratings]
    end
    
    if(!sort)
    @movies = Movie.find_all_by_rating(@visible_ratings.keys)
    else
      if(sort == "title")
      @title_header = 'hilite'
      @movies = Movie.order("title ASC").find_all_by_rating(@visible_ratings.keys)
        else if(sort == "date")
          @release_header = 'hilite'
          @movies = Movie.order("release_date ASC").find_all_by_rating(@visible_ratings.keys)
        end
      end
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
