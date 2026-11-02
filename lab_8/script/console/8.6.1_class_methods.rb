p User.respond_to?(:digest)
p User.respond_to?(:new_token)
p User.singleton_methods(false).sort
p User.new.respond_to?(:digest)
