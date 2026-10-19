p "foobar".length
p "foobar".empty?
p "".empty?

s = "foobar"
if s.empty?
  puts "The string is empty"
else
  puts "The string is nonempty"
end

if s.nil?
  puts "The variable is nil"
elsif s.empty?
  puts "The string is empty"
elsif s.include?("foo")
  puts "The string includes 'foo'"
end

x = "foo"
y = ""
puts "Both strings are empty" if x.empty? && y.empty?
puts "One of the strings is empty" if x.empty? || y.empty?
puts "x is not empty" if !x.empty?

p nil.to_s
begin
  nil.empty?
rescue NoMethodError => error
  puts error.message
end
p nil.to_s.empty?
p "foo".nil?
p "".nil?
p nil.nil?

string = "foobar"
puts "The string '#{string}' is nonempty." unless string.empty?
p !!nil
p !!0
