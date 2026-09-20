users = [
  { name: "Michael Hartl", email: "michael@example.org" },
  { name: "Foo Bar",       email: "foo@bar.com" }
]

michael, _foo = users.map do |attrs|
  User.find_or_create_by!(email: attrs[:email]) { |user| user.name = attrs[:name] }
end

[ "First micropost!", "Second micropost" ].each do |content|
  michael.microposts.find_or_create_by!(content: content)
end

puts "Пользователей: #{User.count}, микросообщений: #{Micropost.count}"
