require "open-uri"

Flat.destroy_all
User.destroy_all

images = [
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-weinerovych-1.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-voglovych-3.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-voglovych-1.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-voglovych-1.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-krausovych-3.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/byt-krausovych-2.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/brummeluv-dum-2.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/brummeluv-dum-3.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/brummeluv-dum-4.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/brummeluv-dum-1.webp",
  "https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3A203d060c-ea53-4856-97bf-e963c9062d06?source=next-article&fit=scale-down&quality=highest&width=700&dpr=2",
  "https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3A02411559-1671-4bdc-a7ea-bab840e8fb11?source=next-article&fit=scale-down&quality=highest&width=700&dpr=2",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/apartman-richarda-hirsche-2.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/apartman-richarda-hirsche-4.webp",
  "https://s3-eu-central-1.amazonaws.com/tf-prod-adolf-loos/loos2024/var/www/rocketstack/web/app/uploads/apartman-richarda-hirsche-1.webp"
]

users = [
  { email: "user1@example.com", password: "123456" },
  { email: "user2@company.com", password: "123456" },
  { email: "hello3@mail.com", password: "123456" },
  { email: "contact4@domain.com", password: "123456" },
  { email: "test5@web.com", password: "123456" },
  { email: "info6@website.com", password: "123456" },
  { email: "mail7@mail.com", password: "123456" },
  { email: "name8@company.com", password: "123456" },
  { email: "user9@sample.com", password: "123456" },
  { email: "demo10@service.com", password: "123456" },
  { email: "admin11@network.com", password: "123456" },
  { email: "support12@help.com", password: "123456" },
  { email: "client13@domain.com", password: "123456" },
  { email: "user14@business.com", password: "123456" },
  { email: "member15@web.com", password: "123456" },
  { email: "register16@mail.com", password: "123456" },
  { email: "account17@provider.com", password: "123456" },
  { email: "profile18@service.com", password: "123456" },
  { email: "subscriber19@domain.com", password: "123456" },
  { email: "guest20@site.com", password: "123456" }
]

flats = [
  { name: "Nice Apartment in Melbourne", description: "This is a nice flat with 2 bedrooms." },
  { name: "Mornington Beach Hut", description: "Ideal for a weekend getaway for the whole family." },
  { name: "Docklands Penthouse", description: "A luxurious penthouse with stunning views of the city skyline." },
  { name: "Fitzroy Artist’s Loft", description: "Spacious and stylish, perfect for creative minds." },
  { name: "Brighton Beachside Retreat", description: "A beautiful escape near the beach." },
  { name: "Southbank Modern Studio", description: "Compact and convenient for city dwellers." },
  { name: "Yarra Riverside Flat", description: "Enjoy riverside views and peaceful surroundings." },
  { name: "Toorak Luxe Residence", description: "An elegant flat in a prime neighborhood." },
  { name: "St Kilda Sunlit Nest", description: "A cozy, sunny flat close to the beach." },
  { name: "Prahran Urban Hideaway", description: "A quiet and trendy retreat in the heart of Prahran." },
  { name: "Carlton Vintage Charm", description: "Charming, with a mix of classic and modern decor." },
  { name: "Richmond Rooftop Loft", description: "Offers a private rooftop with city views." },
  { name: "Hawthorn Garden Apartment", description: "Surrounded by lush gardens and nature." },
  { name: "Port Melbourne Sea Breeze", description: "Breezy, with close access to the waterfront." },
  { name: "Elwood Tranquil Retreat", description: "A serene and peaceful space near local cafes." },
  { name: "CBD Executive Suite", description: "Perfect for professionals needing easy access to the city." },
  { name: "Northcote Cozy Den", description: "A snug flat with a welcoming atmosphere." },
  { name: "South Yarra Designer Pad", description: "Stylish and modern, great for fashion lovers." },
  { name: "Brunswick Hipster Haven", description: "Quirky and fun, in a vibrant neighborhood." },
  { name: "Essendon Family-Friendly Flat", description: "Spacious enough for the whole family with parks nearby." },
  { name: "Albert Park Heritage Flat", description: "A charming historical property near the park." },
  { name: "Malvern Green Oasis", description: "Set among trees and gardens for a peaceful vibe." },
  { name: "Kew Luxury Suite", description: "Luxurious finishes and spacious interiors." },
  { name: "Collingwood Creative Space", description: "Designed with artists and creatives in mind." },
  { name: "Williamstown Seaside Flat", description: "Ideal for beach lovers and those who enjoy fresh air." },
  { name: "Caulfield Family Retreat", description: "A great spot for families with lots of local amenities." },
  { name: "Moonee Ponds Modern Loft", description: "Spacious, open plan, and full of light." },
  { name: "Glen Iris Treehouse", description: "Nestled among trees for a cozy and secluded feel." },
  { name: "South Melbourne City Pad", description: "Perfect for city life with quick access to shops and cafes." },
  { name: "Bentleigh Vintage Apartment", description: "Classic decor with a modern twist in a quiet area." },
  { name: "Mordialloc Beachside Getaway", description: "Relax by the sea with this lovely beachside flat." },
  { name: "Camberwell Family Hub", description: "Spacious and close to schools, ideal for families." },
  { name: "Ashburton Contemporary Flat", description: "Modern styling and open space in a quiet area." },
  { name: "Surrey Hills Classic Apartment", description: "Classic design in a leafy suburb." },
  { name: "Box Hill Chic Flat", description: "Bright, chic, and close to shopping centers." },
  { name: "Doncaster Urban Retreat", description: "Stylish and urban, perfect for young professionals." },
  { name: "Altona Beachfront Flat", description: "Enjoy beachfront views and ocean breezes." },
  { name: "Balwyn Bright Apartment", description: "Bright and airy with a homely feel." },
  { name: "Heidelberg Hillside Retreat", description: "Set on a hillside with panoramic views." },
  { name: "Windsor Modern Den", description: "Modern and cozy, perfect for a single person or couple." },
  { name: "Sandringham Bayside Apartment", description: "Enjoy the bayside lifestyle in a chic flat." },
  { name: "Hampton Family Flat", description: "Spacious and welcoming, great for families." },
  { name: "Cheltenham Designer Studio", description: "Compact, stylish, and near local cafes." },
  { name: "Oakleigh Hidden Gem", description: "A cozy hidden gem near vibrant eateries." },
  { name: "Seaford Beachside Retreat", description: "Steps from the beach with peaceful surroundings." },
  { name: "Frankston Coastal Apartment", description: "Spacious, coastal vibes with modern amenities." },
  { name: "Dandenong Luxe Apartment", description: "Luxurious and spacious with great city views." },
  { name: "Rowville Family Home", description: "Ideal for families with parks and schools nearby." },
  { name: "Glen Waverley Elegant Flat", description: "Stylish and elegant, located in a prime area." },
  { name: "Knoxfield Cozy Flat", description: "A cozy and affordable option in the suburbs." },
  { name: "Ringwood Forest Retreat", description: "Surrounded by trees, a nature lover’s paradise." }
]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end

flats.sample(5).each do |attributes|
  flat = Flat.new(attributes.merge(user: User.all.sample))
  images.sample(2).each do |image|
    file = URI.parse(image).open
    type = file.content_type
    name = File.basename(file.base_uri.path)
    flat.photos.attach(io: file, filename: name, content_type: type)
  end
  flat.save
  puts "Created #{flat.name} with user #{flat.user.email}"
end
