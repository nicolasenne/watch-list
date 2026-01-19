class HomeController < ApplicationController
  def index
    @user = User.first # provisório
    @default_list = @user.lists.find_or_create_by!(name: "Favorites")

    if params[:query].present?
      @results = TmdbClient.search(params[:query])

      @saved_movie_ids = Bookmark
        .joins(:movie)
        .where(list: @user.lists)
        .pluck("movies.external_id")
    end
  end
end