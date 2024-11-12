class CustomerSerializer
  include JSONAPI::Serializer
  attributes  :first_name,
              :last_name,
              :email,
              :street_address,
              :city,
              :state,
              :zip
end
