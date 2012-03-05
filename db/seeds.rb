### make an initial user
# User.create(username: "Edward", password: "123456", password_confirmation: "123456")

### add color records
1.upto(25) do |i|
  Color.create(color_class: 'user_color_' + i.to_s)
end