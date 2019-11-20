# User.create(full_name: "Example User", phone: "0964991298")
# Pitch.create(name: "San bong 1", description: "Ok", country: "Viet nam", city: "Da Nang", district: "Hai Chau", address: "16 Ly Thuong Kiet", start_time: "8:00", end_time: "9:00", limit: "1")
# Pitch.create!({name: "San bong 1", user_id: 1, description: "Ok", country: "Viet nam", city: "Da Nang", district: "Hai Chau", address: "16 Ly Thuong Kiet", start_time: "8:00", end_time: "9:00", limit: "1"})
# 50.times do |n|
#   full_name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   phone = Faker::PhoneNumber.cell_phone
#   User.create!(full_name: full_name, email: email,phone: phone)
# end

99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end
