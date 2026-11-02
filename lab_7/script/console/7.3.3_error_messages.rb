user = User.new(name: "Foo Bar", email: "foo@invalid",
                password: "dude", password_confirmation: "dude")
p user.save
p user.errors.full_messages
p user.errors.count
p user.errors.empty?
p user.errors.any?

include ActionView::Helpers::TextHelper
p pluralize(1, "error")
p pluralize(5, "error")
p pluralize(2, "woman")
p pluralize(3, "erratum")
