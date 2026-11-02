x = 1
p x
p x += 1
p x *= 3
p x -= 8
p x /= 2

@foo = nil
p @foo
p @foo = @foo || "bar"
p @foo = @foo || "baz"

@foo = nil
p @foo ||= "bar"
p @foo ||= "baz"
