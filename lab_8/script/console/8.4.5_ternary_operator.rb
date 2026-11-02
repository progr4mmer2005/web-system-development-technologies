def boolean_example(value)
  if value
    "do_one_thing"
  else
    "do_something_else"
  end
end

p boolean_example(true)
p true ? "do_one_thing" : "do_something_else"
p false ? "do_one_thing" : "do_something_else"

flag = true
var = flag ? "foo" : "bar"
p var

def foo(flag)
  flag ? "bar" : "baz"
end

p foo(true)
p foo(false)

p "1" == "1" ? "remember" : "forget"
p "0" == "1" ? "remember" : "forget"
p !!"0"
