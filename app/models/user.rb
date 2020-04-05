class User < ApplicationRecord
  before_save :email_downcase
  validates :email, presence: true, uniqueness: true,
            format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password
  has_many :tasks, dependent: :destroy

  def email_downcase
    self.email = email.downcase
  end
end
