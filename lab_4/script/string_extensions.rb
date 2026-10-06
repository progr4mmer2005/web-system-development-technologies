# Load this file explicitly for the chapter's console examples and tests.
class String
  def palindrome?
    self == self.reverse
  end

  # Exercise 4.2: add shuffling directly to String.
  def shuffle
    self.split("").shuffle.join
  end
end
