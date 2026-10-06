module RubyTutorial
  def self.string_message(str = "")
    if str.empty?
      "It's an empty string!"
    else
      "The string is nonempty."
    end
  end

  # Exercise 4.1: split a string into characters, shuffle them, and join them.
  def self.string_shuffle(s)
    s.split("").shuffle.join
  end

  # Exercise 4.3: three people combined into a nested hash.
  def self.family_params
    person1 = { first: "Michael", last: "Hartl" }
    person2 = { first: "Jane", last: "Hartl" }
    person3 = { first: "Sam", last: "Hartl" }

    params = { father: person1, mother: person2, child: person3 }
  end

  # Exercise 4.4: the right-hand hash replaces the value of the duplicate key.
  def self.merge_example
    { "a" => 100, "b" => 200 }.merge({ "b" => 300 })
  end

  class Word < String
    def palindrome?
      self == self.reverse
    end
  end

  # A plain Ruby object from section 4.4.5, not an Active Record model.
  class User
    attr_accessor :name, :email

    def initialize(attributes = {})
      @name = attributes[:name]
      @email = attributes[:email]
    end

    def formatted_email
      "#{@name} <#{@email}>"
    end
  end
end
