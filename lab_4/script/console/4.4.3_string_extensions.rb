begin
  p "level".palindrome?
rescue NoMethodError => error
  puts error.message
end

class String
  def palindrome?
    self == self.reverse
  end
end

p "deified".palindrome?
p "level".palindrome?
p "foobar".palindrome?
p "".blank?
p " ".empty?
p " ".blank?
p nil.blank?
