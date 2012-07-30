### make an initial user
# User.create(name: "Edward", username: "edward", password: "123456", password_confirmation: "123456")

### add color records
1.upto(25) do |i|
  Color.create(color_class: 'user_color_' + i.to_s)
end

### convert usernames to names
# User.all.each do |user|
#   user.name = user.username.capitalize if user.name.nil?
#   user.username = user.username.downcase
#   user.save
# end