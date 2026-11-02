p SecureRandom.urlsafe_base64
p User.new_token
p User.new_token.length

User.delete_all
user = User.create(name: "Example User", email: "user@example.com",
                   password: "foobar", password_confirmation: "foobar")
p user.remember_digest
user.remember
p user.remember_token
p user.remember_digest
p user.authenticated?(user.remember_token)
p user.authenticated?("wrong_token")
user.forget
p user.remember_digest
p user.authenticated?("")
