puts "Seeding User and Personnel"
if User.where(email: "admin@example.com").blank?
  user = User.create!(
      email: "admin@example.com",
      password: "password!!",
      password_confirmation: "password!!"
    )
  user.save!
  user.confirm

#  staff1 = Staff.create!(
#    firstname: "Gero",
#    lastname: "Nimo",
#    user_id: user.id,
#    position: 'admin'
#  )
end
