User.create(name: "Michael Hartl", email: "mhartl@example.com",
            password: "foobar", password_confirmation: "foobar")

user = User.find_by(email: "mhartl@example.com")
p user
p user.password_digest
p user.authenticate("not_the_right_password")
p user.authenticate("foobaz")
p user.authenticate("foobar")
p !!user.authenticate("foobar")
