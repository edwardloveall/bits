task :assign_login_tokens => :environment do
  users = User.all
  users.each do |user|
    if user.auth_token.nil?
      user.auth_token = SecureRandom.urlsafe_base64
      user.save
    end
  end
end