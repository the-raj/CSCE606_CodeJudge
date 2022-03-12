class User < ApplicationRecord

  # adds virtual attributes for authentication
  has_secure_password
  # validates email
  validates :my_email_attribute, email: true

end