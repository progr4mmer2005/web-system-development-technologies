# Keep Rails' default filtering and hide Ruby Version Manager internals too.
Rails.backtrace_cleaner.add_silencer { |line| line.match?(/rvm/) }
