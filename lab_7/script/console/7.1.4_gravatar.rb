email = "MHARTL@example.COM"
p Digest::MD5.hexdigest(email.downcase)

user = User.new(name: "Example User", email: "example@railstutorial.org")
puts helper.gravatar_for(user)
puts helper.gravatar_for(user, size: 50)
