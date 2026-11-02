p User.count
p User.first

user = User.first
if user
  p app.users_path
  p app.user_path(user)
  p app.new_user_path
  p app.edit_user_path(user)
  p app.user_url(user)
end
