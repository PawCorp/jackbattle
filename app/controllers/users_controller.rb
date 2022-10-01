class UsersController < Clearance::UsersController
  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    password_confirmation = user_params.delete(:password_confirmation)
    username = user_params.delete(:username)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.password_confirmation = password_confirmation
      user.username = username
    end
  end
end