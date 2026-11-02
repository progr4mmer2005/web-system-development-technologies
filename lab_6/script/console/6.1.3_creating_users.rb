User.delete_all

p User.new

user = User.new(name: "Michael Hartl", email: "mhartl@example.com",
                password: "foobar", password_confirmation: "foobar")
p user
p user.valid?
p user.save
p user
p user.name
p user.email
p user.updated_at

p User.create(name: "A Nother", email: "another@example.org",
              password: "foobar", password_confirmation: "foobar")
foo = User.create(name: "Foo", email: "foo@bar.com",
                  password: "foobar", password_confirmation: "foobar")
p foo
p foo.destroy
p foo
p foo.destroyed?
