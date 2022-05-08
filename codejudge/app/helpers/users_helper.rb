module UsersHelper
  def current_user?(user)
    current_user.id == user.id
  end
end
