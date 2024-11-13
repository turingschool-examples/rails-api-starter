require 'rails_helper'

RSpec.describe 'Subscription Endpoints' do
  before (:each) do
    @customer1 = Customer.create!(
      first_name: "Monkey",
      last_name: "Luffy",
      email: "mluffy@aol.com",
      street_address: "1738",
      city: "Fosha Village",
      state: "East Blue",
      zip: 17171
    )

    @customer2 = Customer.create!(
      first_name: "Vinsmoke",
      last_name: "Sanji",
      email: "ciggylova@gmail.com",
      street_address: "1234",
      city: "Baratie",
      state: "North Blue",
      zip: 38383
    )

    @tea1 = Tea.create!(
      title: "Germa 66's Green Tea",
      description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
      temp: 176.5,
      brew_time: 3.45,
      price: 19.95,
      image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
    )

    @tea2 = Tea.create!(
        title: "Hody Jones' Deep Sea Herbal Tea",
        description: "Crafted by the notorious Hody Jones, this herbal tea is as bold and brash as its creator. Sourced from the depths of the ocean, this blend combines rare underwater herbs that grow in the coral reefs near Fish-Man Island, known for their potent, restorative properties. Infused with deep-sea botanicals like sea kelp, oceanic mint, and a touch of citrus seaweed, Hody Jones’ Deep Sea Herbal Tea offers an invigorating and refreshing experience with each sip.The tea is designed to energize and rejuvenate, much like the relentless determination of Hody himself. Its earthy, slightly briny flavor is complemented by an unexpected sweetness, reflecting the complex character of its creator.",
        temp: 195.0,
        brew_time: 4.50,
        price: 13.50,
        image: "https://www.saatva.com/blog/wp-content/uploads/2021/04/c68ae959-811e-485f-b5d3-d6b7ae56cea2_beginners-tea-guide-main-4.jpeg"
    )

    @tea3 = Tea.create!(
        title: "Arlong’s Tyrant Oolong Tea",
        description: "Arlong’s Tyrant Oolong Tea is as formidable and unforgiving as the man himself. Crafted with precision and power, this bold oolong blend combines high-quality leaves harvested from the rugged mountains of the East Blue, where only the strongest herbs survive the harsh conditions. The tea’s rich, semi-fermented leaves give it a robust flavor profile, balancing smooth floral notes with a deep, slightly smoky undertone—perfect for those who demand strength in every sip.",
        temp: 165.5,
        brew_time: 6.00,
        price: 15.75,
        image: "https://www.health.com/thmb/8VoQnjmlMOtgqsx048dwNfNwC4s=/2122x0/filters:no_upscale():max_bytes(150000):strip_icc()/OolongTea-231cf721d79545c19320a46f8fa4d8d4.jpg"
    )

    @sub1 = Subscription.create!(
      customer: @customer1,
      tea: @tea1,
      active: true,
      frequency: 6
    )

    @sub2 = Subscription.create!(
      customer: @customer1,
      tea: @tea2,
      active: true,
      frequency: 4
    )

    @sub3 = Subscription.create!(
      customer: @customer2,
      tea: @tea1,
      active: true,
      frequency: 12
    )

    @sub4 = Subscription.create!(
      customer: @customer2,
      tea: @tea2,
      active: true,
      frequency: 12
    )

    @sub5 = Subscription.create!(
      customer: @customer2,
      tea: @tea3,
      active: true,
      frequency: 12
    )
  end

  describe 'Show all tea subscriptions' do
    describe 'HAPPY paths' do
      it 'returns all tea subscriptions for all customers' do
        get "/api/v1/subscriptions"

        expect(response).to be_successful
        subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

        subscriptions.each do |subscription|
          attributes = subscription[:attributes]

          expect(subscription[:id]).to be_a(String)
          expect(subscription[:type]).to eq("subscription")

          expect(attributes[:active]).to be_in([true, false])
          expect(attributes[:frequency]).to be_a(Integer)
          expect(attributes).to have_key(:customer)
          expect(attributes).to have_key(:tea)
        end

      end
    end

    describe 'SAD paths' do

    end
  end

  describe 'Show single tea subscriptions' do
    describe 'HAPPY paths' do
      it 'returns all customer and tea information about a single subscription' do
        get "/api/v1/subscriptions/#{@sub1.id}"

        expect(response).to be_successful
        subscription = JSON.parse(response.body, symbolize_names: true)[:data]
        customer = subscription[:attributes][:customer]
        tea = subscription[:attributes][:tea]

        expect(customer[:id]).to eq(@customer1[:id].to_s)
        expect(customer[:type]).to eq("customer")
        expect(customer[:attributes][:first_name]).to eq(@customer1[:first_name])
        expect(customer[:attributes][:last_name]).to eq(@customer1[:last_name])
        expect(customer[:attributes][:email]).to eq(@customer1[:email])
        expect(customer[:attributes][:street_address]).to eq(@customer1[:street_address])
        expect(customer[:attributes][:city]).to eq(@customer1[:city])
        expect(customer[:attributes][:state]).to eq(@customer1[:state])
        expect(customer[:attributes][:zip]).to eq(@customer1[:zip])

        expect(tea[:id]).to eq(@tea1[:id].to_s)
        expect(tea[:type]).to eq("tea")
        expect(tea[:attributes][:title]).to eq(@tea1[:title])
        expect(tea[:attributes][:description]).to eq(@tea1[:description])
        expect(tea[:attributes][:temp]).to eq(@tea1[:temp])
        expect(tea[:attributes][:brew_time]).to eq(@tea1[:brew_time])
        expect(tea[:attributes][:price]).to eq(@tea1[:price])
        expect(tea[:attributes][:image]).to eq(@tea1[:image])

      end
    end

    describe 'SAD paths' do
      it 'returns an error if the subscription does not exist in the database' do
        
      end
    end
  end

  describe 'Update single tea subscriptions' do
    describe 'HAPPY paths' do
      it 'allows a user to toggle a subscriptions active state between true and false' do
        expect(@sub1[:active]).to eq(true)

        headers = { "CONTENT_TYPE" => "application/json"}
        patch "/api/v1/subscriptions/#{@sub1.id}", params: { toggle_active: true }.to_json, headers: headers

        expect(response).to be_successful
        subscription = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(subscription[:attributes][:active]).to eq(false)

        patch "/api/v1/subscriptions/#{@sub1.id}", params: { toggle_active: true }.to_json, headers: headers

        expect(response).to be_successful
        subscription = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(subscription[:attributes][:active]).to eq(true)
      end
    end

    describe 'SAD paths' do

    end
  end
end