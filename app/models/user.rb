class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :nullify

  before_validation :normalize_email

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true, on: :create

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
