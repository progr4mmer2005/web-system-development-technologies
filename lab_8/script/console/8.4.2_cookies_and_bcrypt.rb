p 1.year.from_now
p 10.weeks.ago
p 20.years.from_now.utc
p 1.kilobyte
p 5.megabytes

token = User.new_token
digest = User.digest(token)
p BCrypt::Password.new(digest) == token
p BCrypt::Password.new(digest).is_password?(token)
p BCrypt::Password.new(digest).is_password?("wrong")
