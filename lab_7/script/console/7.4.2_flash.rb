flash = { success: "It worked!", danger: "It failed." }
p flash
flash.each do |key, value|
  puts "#{key}"
  puts "#{value}"
end

flash.each do |message_type, message|
  puts helper.content_tag(:div, message, class: "alert alert-#{message_type}")
end
