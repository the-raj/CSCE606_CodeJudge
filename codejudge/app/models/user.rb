class User < ApplicationRecord

  # adds virtual attributes for authentication
  has_secure_password
  # validates email
  validates :email, presence: true

  has_many :assignments
  has_many :roles, through: :assignments

  enum role: [:student, :ta, :instructor, :admin]
  after_initialize :set_default_role, :if => :new_record?



  def set_default_role
    self.role ||= :student
  end

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def role
    if self.roles.first.nil?
      return nil
    end
    self.roles.first.name
  end
end
