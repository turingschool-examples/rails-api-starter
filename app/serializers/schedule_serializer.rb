class ScheduleSerializer
  include JSONAPI::Serializer
  attributes :title, :date

  attribute :user do |schedule|
    {
      first_name: schedule.user.first_name,
      last_name: schedule.user.last_name,
      email: schedule.user.email
    }
  end

  attribute :shows do |schedule|
    schedule.shows.map do |show|
      {
        artist: show.artist,
        genre: show.genre,
        location: show.location,
        date: show.date,
        time: show.time
      }
    end
  end
end
