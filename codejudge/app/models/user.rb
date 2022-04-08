class User < ApplicationRecord

  # adds virtual attributes for authentication
  has_secure_password
  # validates email
  validates :email, presence: true

  has_many :assignments
  has_many :roles, through: :assignments

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

end
