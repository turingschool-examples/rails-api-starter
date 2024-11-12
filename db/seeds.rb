# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customer1 = Customer.create!(
    first_name: "Monkey",
    last_name: "Luffy",
    email: "mluffy@aol.com",
    street_address: "1738",
    city: "Fosha Village",
    state: "East Blue",
    zip: 17171
)

customer2 = Customer.create!(
    first_name: "Vinsmoke",
    last_name: "Sanji",
    email: "ciggylova@gmail.com",
    street_address: "1234",
    city: "Baratie",
    state: "North Blue",
    zip: 38383
)

customer3 = Customer.create!(
    first_name: "Roronoa",
    last_name: "Zoro",
    email: "3sw0rdsty1e@gmail.com",
    street_address: "999",
    city: "Shimotsuki",
    state: "East Blue",
    zip: 45467
)

tea1 = Tea.create!(
    title: "Germa 66's Green Tea",
    description: "Germa 66, the technologically advanced and militaristic organization from One Piece, is known for its precision and superior craftsmanship, and their green tea is no exception. This carefully crafted blend combines the finest handpicked leaves from the hidden tea gardens of the North Blue, known for their rich, vibrant flavor and smooth texture. The tea leaves undergo a meticulous process of steam preservation, locking in the natural freshness and antioxidants that define Germa 66’s commitment to excellence.",
    temp: 176.5,
    brew_time: 3.45,
    price: 19.95,
    image: "https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_755721_16914865403343161.jpg"
)

tea2 = Tea.create!(
    title: "Hody Jones' Deep Sea Herbal Tea",
    description: "Crafted by the notorious Hody Jones, this herbal tea is as bold and brash as its creator. Sourced from the depths of the ocean, this blend combines rare underwater herbs that grow in the coral reefs near Fish-Man Island, known for their potent, restorative properties. Infused with deep-sea botanicals like sea kelp, oceanic mint, and a touch of citrus seaweed, Hody Jones’ Deep Sea Herbal Tea offers an invigorating and refreshing experience with each sip.The tea is designed to energize and rejuvenate, much like the relentless determination of Hody himself. Its earthy, slightly briny flavor is complemented by an unexpected sweetness, reflecting the complex character of its creator.",
    temp: 195.0,
    brew_time: 4.50,
    price: 13.50,
    image: "https://www.saatva.com/blog/wp-content/uploads/2021/04/c68ae959-811e-485f-b5d3-d6b7ae56cea2_beginners-tea-guide-main-4.jpeg"
)

tea3 = Tea.create!(
    title: "Arlong’s Tyrant Oolong Tea",
    description: "Arlong’s Tyrant Oolong Tea is as formidable and unforgiving as the man himself. Crafted with precision and power, this bold oolong blend combines high-quality leaves harvested from the rugged mountains of the East Blue, where only the strongest herbs survive the harsh conditions. The tea’s rich, semi-fermented leaves give it a robust flavor profile, balancing smooth floral notes with a deep, slightly smoky undertone—perfect for those who demand strength in every sip.",
    temp: 165.5,
    brew_time: 6.00,
    price: 15.75,
    image: "https://www.health.com/thmb/8VoQnjmlMOtgqsx048dwNfNwC4s=/2122x0/filters:no_upscale():max_bytes(150000):strip_icc()/OolongTea-231cf721d79545c19320a46f8fa4d8d4.jpg"
)

tea4 = Tea.create!(
    title: "Blackbeard’s Dark Abyss Black Tea",
    description: "Blackbeard’s Dark Abyss Black Tea is a tea as mysterious and menacing as its creator, the infamous pirate Blackbeard. This bold and daring black tea is brewed from hand-picked leaves grown in the shadow of treacherous mountains, where only the most resilient plants thrive in the harshest climates. The tea’s dark, rich liquor is intense, with deep malty flavors and a smoky finish, offering a taste that is both powerful and enigmatic—just like the pirate who commands it.",
    temp: 185.5,
    brew_time: 4.75,
    price: 25.99,
    image: "https://inthekitchen.org/wp-content/uploads/2017/03/Fun-Facts-of-Black-Tea-2-1.jpg"
)

tea5 = Tea.create!(
    title: "Whitebeard’s Legacy White Tea",
    description: "Whitebeard’s Legacy White Tea is as timeless and revered as the legendary pirate captain himself. Crafted with the utmost care, this delicate and refined white tea is harvested from the youngest, tender tea leaves that grow in the serene, sun-kissed hills of the Grand Line. These rare leaves are carefully hand-plucked at dawn, ensuring the freshest and most subtle flavor, much like Whitebeard’s own quiet yet undeniable power.",
    temp: 190.0,
    brew_time: 5.00,
    price: 9.99,
    image: "https://twinings.co.uk/cdn/shop/articles/feature_what-is-white-tea_1939640d-a864-4ed6-89e5-d8a49a305e00.jpg?v=1648138091"
)
# CUSTOMER 1 SUBSCRIPTIONS
Subscription.create!(
    customer: customer1,
    tea: tea1,
    active: true,
    frequency: 6
)

Subscription.create!(
    customer: customer1,
    tea: tea2,
    active: true,
    frequency: 4
)

Subscription.create!(
    customer: customer1,
    tea: tea5,
    active: true,
    frequency: 12
)

# CUSTOMER 2 SUBSCRIPTIONS
Subscription.create!(
    customer: customer2,
    tea: tea1,
    active: true,
    frequency: 12
)

Subscription.create!(
    customer: customer2,
    tea: tea2,
    active: true,
    frequency: 12
)

Subscription.create!(
    customer: customer2,
    tea: tea3,
    active: true,
    frequency: 12
)

Subscription.create!(
    customer: customer2,
    tea: tea4,
    active: true,
    frequency: 12
)

Subscription.create!(
    customer: customer2,
    tea: tea5,
    active: true,
    frequency: 12
)

# CUSTOMER 3 SUBSCRIPTIONS
Subscription.create!(
    customer: customer3,
    tea: tea3,
    active: true,
    frequency: 2
)

Subscription.create!(
    customer: customer3,
    tea: tea4,
    active: true,
    frequency: 2
)