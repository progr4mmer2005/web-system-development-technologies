User.delete_all
user = User.create(name: "Michael Hartl", email: "mhartl@example.com",
                   password: "foobar", password_confirmation: "foobar")
User.create(name: "A Nother", email: "another@example.org",
            password: "foobar", password_confirmation: "foobar")
foo = User.create(name: "Foo", email: "foo@bar.com",
                  password: "foobar", password_confirmation: "foobar")
foo.destroy

p User.find(user.id)

begin
  User.find(foo.id)
rescue ActiveRecord::RecordNotFound => error
  puts error.message
end

p User.find_by(email: "mhartl@example.com")
p User.first
p User.all
p User.count
