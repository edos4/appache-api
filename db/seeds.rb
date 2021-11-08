puts "Seeding User and Personnel"
if User.where(email: "admin@example.com").blank?
  user = User.create!(
      email: "admin@example.com",
      password: "password!!",
      password_confirmation: "password!!"
    )
  user.save!

  #user.confirm

  staff1 = Staff.create!(
    firstname: "Gero",
    lastname: "Nimo",
    user_id: user.id,
    role: 'admin'
  )
end

if User.where(email: "staff@example.com").blank?
  user = User.create!(
      email: "staff@example.com",
      password: "password!!",
      password_confirmation: "password!!"
    )
  user.save!

  #user.confirm

  staff1 = Staff.create!(
    firstname: "Staff",
    lastname: "Account",
    user_id: user.id,
    role: 'Staff'
  )
end

if User.where(email: "rocket@example.com").blank?
  user = User.create!(
      email: "rocket@example.com",
      password: "password!!",
      password_confirmation: "password!!"
    )
  user.save!

  #user.confirm

  staff1 = Staff.create!(
    firstname: "Rocket",
    lastname: "Account",
    user_id: user.id,
    role: 'Rocket'
  )
end

if User.where(email: "wolf@example.com").blank?
  user = User.create!(
      email: "wolf@example.com",
      password: "password!!",
      password_confirmation: "password!!"
    )
  user.save!

  #user.confirm

  staff1 = Staff.create!(
    firstname: "Wolf",
    lastname: "Account",
    user_id: user.id,
    role: 'Wolf'
  )
end