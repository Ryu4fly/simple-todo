puts '~Destroying All Users~'
User.destroy_all
sleep 1

puts '~Creating Users~'
sleep 1
user = User.new(username: 'admin', email: 'admin@test.com', password: 'password', password_confirmation: 'password', role: 1)
puts "#{user.username} created!" if user.save

4.times do
  sleep 1
  username, email, password = Faker::Internet.user('username', 'email', 'password').values
  password = Argon2::Password.create(password)
  user = User.new(username:, email:, password:, password_confirmation: password)
  puts "#{user.username} created!" if user.save
end
