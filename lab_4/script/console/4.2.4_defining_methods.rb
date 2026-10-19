def string_message(str = "")
  if str.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

puts string_message("foobar")
puts string_message("")
puts string_message

def string_message(str = "")
  return "It's an empty string!" if str.empty?

  return "The string is nonempty."
end

puts string_message("foobar")
puts string_message("")
puts string_message

def string_message(the_function_argument = "")
  if the_function_argument.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

puts string_message("")
puts string_message("foobar")
