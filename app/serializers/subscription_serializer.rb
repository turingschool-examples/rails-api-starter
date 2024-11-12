class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency

  belongs_to :tea, serializer: TeaSerializer

  def self.show_sub(id)
        {
        "id": id,
        "type": "subscription",
        "attributes": {
          "title": movie[:original_title],
          "release_year": movie[:release_date][0..3],
          "vote_average": movie[:vote_average],
          "runtime": format_runtime(movie[:runtime]),
          "genres": generes,
          "summary": movie[:overview],
          "cast": cast,
          "total_reviews": review.count,
          "reviews": review
          }
        }
  end

end
