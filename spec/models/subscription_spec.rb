require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'toggle_active()' do
    it 'toggles a subscriptions active status between true and false' do
      customer1 = Customer.create!(
        first_name: "Monkey",
        last_name: "Luffy",
        email: "mluffy@aol.com",
        street_address: "1738",
        city: "Fosha Village",
        state: "East Blue",
        zip: 17171
      )
  
      tea1 = Tea.create!(
        title: "Germa 66's Green Tea",
        description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
        temp: 176.5,
        brew_time: 3.45,
        price: 19.95,
        image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
      )
  
      sub1 = Subscription.create!(
        customer: customer1,
        tea: tea1,
        active: true,
        frequency: 6
      )

      expect(sub1[:active]).to eq(true)

      sub1.toggle_active

      expect(sub1[:active]).to eq(false)

      sub1.toggle_active

      expect(sub1[:active]).to eq(true)
    end
  end
end