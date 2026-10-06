require_relative "../lib/ruby_tutorial"
require_relative "string_extensions"

puts "4.1 string_shuffle: split -> shuffle -> join"
p RubyTutorial.string_shuffle("foobar")

puts "4.2 String#shuffle"
p "foobar".shuffle

puts "4.3 Nested hashes"
params = RubyTutorial.family_params
p params
puts "Father's first name: #{params[:father][:first]}"
puts "Mother's first name: #{params[:mother][:first]}"
puts "Child's first name: #{params[:child][:first]}"

puts "4.4 Hash#merge"
original = { "a" => 100, "b" => 200 }
p original.merge({ "b" => 300 })
puts "Original hash: #{original.inspect}"
