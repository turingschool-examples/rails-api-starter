class ShowSerializer
  include JSONAPI::Serializer
  attributes :artist, :genre, :location

  attribute :date do |show|
    show.date.strftime('%Y-%m-%d')
  end

  attribute :time do |show|
    show.time.strftime('%H:%M') if show.time
  end
end
