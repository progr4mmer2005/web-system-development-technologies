p %w[foo bar baz]
addresses = %w[USER@foo.COM THE_US-ER@foo.bar.org first.last@foo.jp]
p addresses
addresses.each do |address|
  puts address
end

p User::VALID_EMAIL_REGEX

valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                     first.last@foo.jp alice+bob@baz.cn]
valid_addresses.each do |address|
  puts "#{address.inspect} => #{address.match?(User::VALID_EMAIL_REGEX)}"
end

invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com]
invalid_addresses.each do |address|
  puts "#{address.inspect} => #{address.match?(User::VALID_EMAIL_REGEX)}"
end
