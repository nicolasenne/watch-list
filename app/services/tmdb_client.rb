require "net/http"
require "json"

class TmdbClient
  BASE_URL = "https://api.themoviedb.org/3"

  def self.search(query)
    uri = URI("#{BASE_URL}/search/movie")
    uri.query = URI.encode_www_form(
      api_key: Rails.application.credentials.dig(:tmdb, :api_key),
      query: query
    )

    response = Net::HTTP.get(uri)
    JSON.parse(response)["results"]
  end
end