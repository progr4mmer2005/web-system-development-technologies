first_hash = { "a" => 100, "b" => 200 }
second_hash = { "b" => 300 }

merged_hash = first_hash.merge(second_hash)

p merged_hash
p first_hash
p second_hash
p merged_hash == { "a" => 100, "b" => 300 }
p first_hash == { "a" => 100, "b" => 200 }
p second_hash == { "b" => 300 }
p merged_hash.equal?(first_hash)
