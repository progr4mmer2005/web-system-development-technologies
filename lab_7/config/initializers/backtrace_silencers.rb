Rails.backtrace_cleaner.add_silencer { |line| line.match?(/rvm/) }
