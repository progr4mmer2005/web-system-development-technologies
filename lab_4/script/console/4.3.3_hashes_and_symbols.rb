user = {}
user["first_name"] = "Michael"
user["last_name"] = "Hartl"
p user["first_name"]
p user

user = { "first_name" => "Michael", "last_name" => "Hartl" }
p user
p "name".split("")

begin
  p :name.split("")
rescue NoMethodError => error
  puts error.message
end

p "foobar".reverse
begin
  p :foobar.reverse
rescue NoMethodError => error
  puts error.message
end

begin
  p :foo-bar
rescue NameError => error
  puts error.message
end

begin
  eval(":2foo")
rescue SyntaxError => error
  puts error.message
end

user = { :name => "Michael Hartl", :email => "michael@example.com" }
p user[:name]
p user[:password]
h1 = { :name => "Michael Hartl", :email => "michael@example.com" }
h2 = { name: "Michael Hartl", email: "michael@example.com" }
p h1 == h2

params = {}
params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }
p params
p params[:user][:email]

flash = { success: "It worked!", danger: "It failed." }
flash.each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end

puts (1..5).to_a
puts (1..5).to_a.inspect
puts :name, :name.inspect
puts "It worked!", "It worked!".inspect
p :name
