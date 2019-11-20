User.create!({full_name:  "Admin user",
           email: "admin@soccer.org",
           password_digest: "admin",
           activated: true,
           activated_at: Time.zone.now})
50.times do |n|
  name = "User_#{n}"
  desc = "Day la mot ta #{n}"
  password = "password"
  password = "password"

  Pitch.create!({user_id: 1,
           name: name,
           description: desc,
           country: "VN",
           city: "Da nang",
           phone: "5555555555",
           district: "Hai chau",
           address: "22 le duan",
           limit: 2})
end
