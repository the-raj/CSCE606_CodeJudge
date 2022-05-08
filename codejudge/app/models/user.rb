class User < ApplicationRecord
  include BCrypt

  attr_accessor :password, :password_confirmation

  validates :password, length: (6..30), confirmation: true, on: :create, unless: :third_party_account?
  validates :password_confirmation, length: (6..30), on: :create, unless: :third_party_account?

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def authenticate(password)
    password.present? && self.password_digest.present? && Password.new(self.password_digest) == password
  end

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true, uniqueness: true, length: (4..30)
  validates :email, presence: true, email: true, uniqueness: true
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments
  accepts_nested_attributes_for :roles
  has_many :attempts, dependent: :destroy
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.roles << Role.find_by_name(:student)
  end

  def role?(role)
    self.roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def role
    if self.roles.first.nil?
      return nil
    end
    self.roles.first.name
  end

  private
  def third_party_account?
    self.google_id
  end
end
