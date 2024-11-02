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
  { name: "Modern 2-Bedroom Apartment in Melbourne CBD", description: "Spacious apartment with city views and modern amenities.", address: "18 Queen St, Melbourne VIC 3000" },
  { name: "Cozy 1-Bedroom Unit Near La Trobe St", description: "Comfortable unit with open-plan living and close to public transport.", address: "8 La Trobe St, Melbourne VIC 3000" },
  { name: "Luxury 2-Bedroom Apartment on Russell St", description: "High-end apartment with premium finishes and city skyline views.", address: "9 Russell St, Melbourne VIC 3000" },
  { name: "Seaside 2-Bedroom Apartment in Mornington", description: "Cozy apartment close to the beach with lovely views.", address: "5 Esplanade St, Mornington VIC 3931" },
  { name: "Beachfront Studio in Sorrento", description: "Charming studio steps from the beach, perfect for getaways.", address: "2 Ocean Beach Rd, Sorrento VIC 3943" },
  { name: "Coastal 3-Bedroom Home in Lorne", description: "Spacious home with a balcony overlooking the ocean.", address: "10 Great Ocean Rd, Lorne VIC 3232" },
  { name: "Chic 1-Bedroom Flat in Torquay", description: "Stylish flat close to beaches and surf spots.", address: "8 Surf St, Torquay VIC 3228" },
  { name: "Contemporary 2-Bedroom Apartment in St Kilda", description: "Modern apartment near the waterfront.", address: "12 Beach Rd, St Kilda VIC 3182" },
  { name: "Bright 2-Bedroom Apartment on Franklin St", description: "Well-lit apartment with contemporary design.", address: "22 Franklin St, Melbourne VIC 3000" },
  { name: "Peaceful 1-Bedroom Flat in Rye", description: "Quiet, cozy flat with a private garden area.", address: "14 Golf Pde, Rye VIC 3941" },
  { name: "Luxury 2-Bedroom Apartment on Collins St", description: "High-end finishes with panoramic city views.", address: "32 Collins St, Melbourne VIC 3000" },
  { name: "Seaside 1-Bedroom Apartment in Portsea", description: "Elegant design close to the water.", address: "3 Point Nepean Rd, Portsea VIC 3944" },
  { name: "Contemporary 2-Bedroom Apartment on Little Lonsdale St", description: "Modern design with spacious living areas.", address: "16 Little Lonsdale St, Melbourne VIC 3000" },
  { name: "Elegant 3-Bedroom Home in Apollo Bay", description: "Spacious home with scenic ocean views.", address: "25 Great Ocean Rd, Apollo Bay VIC 3233" },
  { name: "Cozy 2-Bedroom House in Queenscliff", description: "Charming house with a garden and walking distance to the beach.", address: "9 Hesse St, Queenscliff VIC 3225" },
  { name: "Beachside 1-Bedroom Flat in Rosebud", description: "Cozy and compact with ocean access nearby.", address: "7 Point Nepean Rd, Rosebud VIC 3939" },
  { name: "Affordable 1-Bedroom Unit on Elizabeth St", description: "Budget-friendly unit in a prime location.", address: "7 Elizabeth St, Melbourne VIC 3000" },
  { name: "Spacious 2-Bedroom Home in Anglesea", description: "Large home with ocean views, ideal for families.", address: "10 Great Ocean Rd, Anglesea VIC 3230" },
  { name: "Luxury Beachfront Villa in Portsea", description: "High-end villa with a private pool and ocean views.", address: "4 Portsea Way, Portsea VIC 3944" },
  { name: "Elegant 2-Bedroom Apartment on Lonsdale St", description: "Stylish apartment with quality finishes.", address: "19 Lonsdale St, Melbourne VIC 3000" },
  { name: "Modern 1-Bedroom Apartment on Swanston St", description: "Sleek design with open living space.", address: "8 Swanston St, Melbourne VIC 3000" },
  { name: "Stylish 2-Bedroom Apartment on La Trobe St", description: "Modern design with city views.", address: "30 La Trobe St, Melbourne VIC 3000" },
  { name: "Peaceful Cottage in Barwon Heads", description: "Cozy cottage with garden near the Barwon River.", address: "12 Bridge Rd, Barwon Heads VIC 3227" },
  { name: "Chic 2-Bedroom Apartment on A'Beckett St", description: "Contemporary finishes with open-plan living.", address: "15 A'Beckett St, Melbourne VIC 3000" },
  { name: "Cozy 1-Bedroom Flat on Little Collins St", description: "Compact living space in a prime location.", address: "10 Little Collins St, Melbourne VIC 3000" },
  { name: "Seaside 2-Bedroom Unit in Blairgowrie", description: "Quiet, sunny unit near the Blairgowrie beach.", address: "15 Tasman Dr, Blairgowrie VIC 3942" },
  { name: "Luxury 3-Bedroom Apartment on Queens Rd", description: "High-end finishes with panoramic city views.", address: "4 Queens Rd, Melbourne VIC 3004" },
  { name: "Spacious Beachfront House in Jan Juc", description: "Large house with ocean views, great for surfing enthusiasts.", address: "6 Surf St, Jan Juc VIC 3228" },
  { name: "Modern 2-Bedroom Unit in Dromana", description: "Comfortable unit with modern amenities, near the beach.", address: "7 Marine Dr, Dromana VIC 3936" },
  { name: "Elegant 2-Bedroom Apartment on St Kilda Rd", description: "Chic apartment near Albert Park and St Kilda beach.", address: "10 St Kilda Rd, Melbourne VIC 3004" }
]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email} with password #{user.password}"
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
