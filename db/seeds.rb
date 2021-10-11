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
    user_id: "350ab220-a972-49d4-8385-b87d6cf80fd1",
    role: 'admin'
  )
end
