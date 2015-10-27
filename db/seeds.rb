### make an initial user
User.create(name: 'Edward', username: 'edward', password: 'password', password_confirmation: 'password')

### add color records
1.upto(25) do |i|
  Color.create(color_class: 'user_color_' + i.to_s)
end
