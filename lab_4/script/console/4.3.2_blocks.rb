(1..5).each { |i| puts 2 * i }

(1..5).each do |i|
  puts 2 * i
end

(1..5).each do |number|
  puts 2 * number
  puts "--"
end

3.times { puts "Betelgeuse!" }
p (1..5).map { |i| i**2 }
p %w[a b c]
p %w[a b c].map { |char| char.upcase }
p %w[A B C].map { |char| char.downcase }
p %w[A B C].map(&:downcase)
p ("a".."z").to_a
p ("a".."z").to_a.shuffle
p ("a".."z").to_a.shuffle[0..7]
p ("a".."z").to_a.shuffle[0..7].join
