class BookmarksController < ApplicationController
def create
  @list = List.find(params[:list_id])

  movie = Movie.find_or_create_by!(external_id: movie_params[:external_id]) do |m|
    m.title        = movie_params[:title]
    m.overview     = movie_params[:overview]
    m.poster_url   = movie_params[:poster_url]
    m.backdrop_url = movie_params[:backdrop_url]
    m.release_year = movie_params[:release_year]
    m.rating       = movie_params[:rating]
  end

  Bookmark.create!(list: @list, movie: movie)

  redirect_back fallback_location: root_path,
                notice: "Movie saved to #{ @list.name }"
end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def movie_params
    params.require(:movie).permit(
      :external_id,
      :title,
      :overview,
      :poster_url,
      :backdrop_url,
      :release_year,
      :rating
    )
  end
end