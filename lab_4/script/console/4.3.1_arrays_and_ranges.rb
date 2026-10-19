p "foo bar baz".split
p "fooxbarxbazx".split("x")

a = [42, 8, 17]
p a[0]
p a[1]
p a[2]
p a[-1]
p a
p a.first
p a.second
p a.last
p a.last == a[-1]

x = a.length
p x
p x == 3
p x == 1
p x != 1
p x >= 1
p x < 1
p a.empty?
p a.include?(42)
p a.sort
p a.reverse
p a.shuffle
p a
p a.sort!
p a
p a.push(6)
p a << 7
p a << "foo" << "bar"
p a.join
p a.join(", ")

p 0..9
begin
  p 0..9.to_a
rescue NoMethodError => error
  puts error.message
end
p (0..9).to_a

a = %w[foo bar baz quux]
p a
p a[0..2]
a = (0..9).to_a
p a[2..(a.length - 1)]
p a[2..-1]
p ("a".."e").to_a
