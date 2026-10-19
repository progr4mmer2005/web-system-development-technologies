s = String.new("foobar")
p s.class
p s.class.superclass
p s.class.superclass.superclass
p s.class.superclass.superclass.superclass

Object.send(:remove_const, :Word) if Object.const_defined?(:Word, false)

class Word
  def palindrome?(string)
    string == string.reverse
  end
end

w = Word.new
p w.palindrome?("foobar")
p w.palindrome?("level")

Object.send(:remove_const, :Word)

class Word < String
  def palindrome?
    self == self.reverse
  end
end

s = Word.new("level")
p s.palindrome?
p Word.new("foobar").palindrome?
p s.length
p s.class
p s.class.superclass
p s.class.superclass.superclass
