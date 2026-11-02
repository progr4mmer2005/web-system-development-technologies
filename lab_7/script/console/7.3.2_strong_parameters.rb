params = ActionController::Parameters.new(
  user: { name: "Foo Bar", email: "foo@invalid", password: "foo",
          password_confirmation: "bar", admin: "1" }
)

begin
  User.new(params[:user])
rescue ActiveModel::ForbiddenAttributesError => error
  puts error.class
end

permitted = params.require(:user).permit(:name, :email, :password,
                                         :password_confirmation)
p permitted.to_h
p permitted.key?(:admin)
p User.new(permitted).name
