# Run with: ruby bin/rails runner script/ruby_basics.rb
require_relative "../lib/ruby_tutorial"
require_relative "string_extensions"

def show(expression, value)
  puts "#{expression} => #{value.inspect}"
end

puts "4.2 Strings, methods, conditions, and return values"
first_name = "Michael"
last_name = "Hartl"
show('"foo" + "bar"', "foo" + "bar")
show('"#{first_name} #{last_name}"', "#{first_name} #{last_name}")
show("Single quotes keep interpolation literal", '#{first_name} Hartl')
show("Single quotes keep backslash n literal", '\n')
show("Double quotes produce a newline", "\n")
print "print has no newline; "
puts "puts adds one."
show('"foobar".length', "foobar".length)
show('"".empty?', "".empty?)
show("nil.to_s.empty?", nil.to_s.empty?)
show("nil.nil?", nil.nil?)
show("!!nil", !!nil)
show("!!0", !!0)

text = "foobar"
message = if text.nil?
  "The variable is nil"
elsif text.empty?
  "The string is empty"
elsif text.include?("foo")
  "The string includes 'foo'"
end
show("if / elsif", message)
show("AND", text.empty? && "".empty?)
show("OR", text.empty? || "".empty?)
show("NOT", !text.empty?)
puts "unless runs when the condition is false" unless text.empty?
show("string_message with default argument", RubyTutorial.string_message)
show("string_message with a string", RubyTutorial.string_message(text))
show("full_title with no page name", ApplicationController.helpers.full_title)
show("full_title with Help", ApplicationController.helpers.full_title("Help"))

puts "4.3 Arrays, ranges, blocks, hashes, and symbols"
show("split on whitespace", "foo bar baz".split)
show("split on x", "fooxbarxbazx".split("x"))
numbers = [42, 8, 17]
show("array indexing", [numbers[0], numbers[1], numbers[-1]])
show("first / second / last", [numbers.first, numbers.second, numbers.last])
show("comparisons", [numbers.length == 3, numbers.length != 1, numbers.length >= 1])
show("include?", numbers.include?(42))
show("sort returns a new array", numbers.sort)
show("the original array", numbers)
show("reverse", numbers.reverse)
show("shuffle", numbers.shuffle)
numbers.sort!
show("sort! changes the original array", numbers)
numbers.push(6)
numbers << 7 << "foo" << "bar"
show("push and <<", numbers)
show("join", numbers.join(", "))
show("range to array", (0..9).to_a)
show("array slice", (0..9).to_a[2..-1])
show("letter range", ("a".."e").to_a)
(1..3).each { |number| puts "each: #{2 * number}" }
3.times { puts "Betelgeuse!" }
show("map squares", (1..5).map { |number| number**2 })
show("map with a symbol", %w[A B C].map(&:downcase))
show("random eight-letter string", ("a".."z").to_a.shuffle[0..7].join)

old_hash = { :name => "Michael Hartl", :email => "mhartl@example.com" }
new_hash = { name: "Michael Hartl", email: "mhartl@example.com" }
show("two symbol-key syntaxes are equivalent", old_hash == new_hash)
show("missing hash key", new_hash[:password])
params = { user: new_hash }
show("nested hash access", params[:user][:email])
{ success: "It worked!", danger: "It failed." }.each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end
show("inspect", (1..5).to_a.inspect)
show("stylesheet_link_tag with an options hash",
  ApplicationController.helpers.stylesheet_link_tag(:app, media: "all"))

puts "4.4 Constructors, inheritance, self, and instance attributes"
show("String.new", String.new("foobar"))
show("Array.new", Array.new([1, 3, 2]))
show("Hash.new with a default value", Hash.new(0)[:missing])
show("String ancestry", [String.superclass, String.superclass.superclass])
word = RubyTutorial::Word.new("level")
show("Word#palindrome?", word.palindrome?)
show("Word inherits String#length", word.length)
show("Word superclass", word.class.superclass)
show("String#palindrome? after reopening String", "deified".palindrome?)
show("Rails blank? versus empty?", [" ".empty?, " ".blank?, nil.blank?])
controller = StaticPagesController.new
show("controller class", controller.class)
show("controller superclass", controller.class.superclass)
show("ApplicationController superclass", ApplicationController.superclass)
show("an empty controller action returns nil", controller.home)

example = RubyTutorial::User.new
show("user attributes before assignment", [example.name, example.email])
example.name = "Example User"
example.email = "user@example.com"
show("formatted_email after assignment", example.formatted_email)
user = RubyTutorial::User.new(name: "Michael Hartl", email: "mhartl@example.com")
show("formatted_email after initialization", user.formatted_email)
