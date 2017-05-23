# Seed three sports
Sport.find_or_create_by(name: 'football', icon: 'football_icon')
Sport.find_or_create_by(name: 'basketball', icon: 'basketball_icon')
Sport.find_or_create_by(name: 'baseball', icon: 'baseball_icon')

User.find_or_create_by(email: 'user1@gmail.com') do |user|
  user.first_name = 'John'
  user.last_name = 'Doe'
  user.height_inches = 72
  user.weight_pounds = 185
end

User.find_or_create_by(email: 'userA@gmail.com') do |user|
  user.first_name = 'Jane'
  user.last_name = 'Doe'
  user.height_inches = 60
  user.weight_pounds = 150
  user.private_profile = true
end
