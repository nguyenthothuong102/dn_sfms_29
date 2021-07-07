
# User.create(full_name: "Example User", phone: "0964991298")
# Pitch.create(name: "San bong 1", description: "Ok", country: "Viet nam", city: "Da Nang", district: "Hai Chau", address: "16 Ly Thuong Kiet", start_time: "8:00", end_time: "9:00", limit: "1")
# Pitch.create!({name: "San bong 1", user_id: 1, description: "Ok", country: "Viet nam", city: "Da Nang", district: "Hai Chau", address: "16 Ly Thuong Kiet", start_time: "8:00", end_time: "9:00", limit: "1"})
# 50.times do |n|
#   full_name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   phone = Faker::PhoneNumber.cell_phone
#   User.create!(full_name: full_name, email: email,phone: phone)
# end

# 99.times do |n|
#   name  = Faker::Name.name
#   user_id = 1
#   description = Faker::Name.name
#   address = Faker::Address.street_address
#   Pitch.create!(name: name, user_id: user_id, description: description, address: address)
# end
# Pitch.create!({name: "San bong 1", user_id: 1, description: "Ok", country: "Viet nam", city: "Da Nang", district: "Hai Chau", address: "16 Ly Thuong Kiet", start_time: "8:00", end_time: "9:00", limit: "1"})
User.create(full_name: "Example User", phone: "0964991298", email: "admin@soccer.vn",
  password: "admin123", password_confirmation: "admin123", role: 0, activated: true, activated_at: Time.zone.now)
99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end

SubpitchType.create!({name: "loai vip"})

pitches = Pitch.all
pitches.each{|pitch|
  5.times do |n|
    name = "Subpitch #{n}"
    desc = "Desc #{n}"
    price = 1000000
    size = "5 người"
    pitch.subpitches.create!({
             subpitch_type_id: 1,
             name: name,
             description: desc,
             price_per_hour: price,
             currency: "Đồng",
             size: size
    })
  end
}
