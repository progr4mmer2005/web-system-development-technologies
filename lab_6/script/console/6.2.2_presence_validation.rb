user = User.new(name: "", email: "mhartl@example.com",
                password: "foobar", password_confirmation: "foobar")
p user.valid?
p user.errors.full_messages
p user.save

user = User.new(name: "Example User", email: "   ",
                password: "foobar", password_confirmation: "foobar")
p user.valid?
p user.errors.full_messages
