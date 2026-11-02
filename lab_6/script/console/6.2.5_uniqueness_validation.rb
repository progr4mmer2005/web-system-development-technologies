User.delete_all
user = User.create(name: "Example User", email: "user@example.com",
                   password: "foobar", password_confirmation: "foobar")
p user.email.upcase

duplicate_user = user.dup
duplicate_user.email = user.email.upcase
p duplicate_user.valid?
p duplicate_user.errors.full_messages

mixed = User.create(name: "Mixed Case", email: "Foo@ExAMPle.CoM",
                    password: "foobar", password_confirmation: "foobar")
p mixed.reload.email

p ActiveRecord::Base.connection.indexes(:users).map { |index| [index.columns, index.unique] }
