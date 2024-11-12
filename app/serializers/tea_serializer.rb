class TeaSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :tempature, :brew_time
end
