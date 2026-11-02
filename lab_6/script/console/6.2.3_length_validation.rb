p "a" * 51
p ("a" * 51).length
p "a" * 244 + "@example.com"
p ("a" * 244 + "@example.com").length

user = User.new(name: "a" * 51, email: "a" * 244 + "@example.com",
                password: "foobar", password_confirmation: "foobar")
p user.valid?
p user.errors.full_messages
