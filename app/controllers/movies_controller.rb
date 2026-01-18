class MoviesController < ApplicationController
  def search
    return if params[:query].blank?

    @results = TmdbClient.search(params[:query])
  end
end