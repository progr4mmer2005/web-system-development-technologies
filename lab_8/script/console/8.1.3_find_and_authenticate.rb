User.delete_all
User.create(name: "Example User", email: "user@example.com",
            password: "foobar", password_confirmation: "foobar")

params = { session: { email: "USER@example.com", password: "foobar" } }
user = User.find_by(email: params[:session][:email].downcase)
p user

p !!(nil && nil.authenticate("foobar"))
p !!(user && user.authenticate("wrong"))
p !!(user && user.authenticate("foobar"))
