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

example = User.new
p example
p example.name
p example.email
example.name = "Example User"
example.email = "user@example.com"
puts example.formatted_email

user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
p user.name
p user.email
puts user.formatted_email
puts example.formatted_email
