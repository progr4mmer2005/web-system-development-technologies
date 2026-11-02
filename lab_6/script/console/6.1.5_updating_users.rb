User.delete_all
user = User.create(name: "Michael Hartl", email: "mhartl@example.com",
                   password: "foobar", password_confirmation: "foobar")
p user

user.email = "mhartl@example.net"
p user.save
p user.email

user.email = "foo@bar.com"
p user.reload.email

sleep 1
user.update(email: "mhartl@example.org")
p user.created_at
p user.updated_at
p user.created_at == user.updated_at

p user.update(name: "The Dude", email: "dude@abides.org")
p user.name
p user.email

p user.update_attribute(:name, "El Duderino")
p user.name
