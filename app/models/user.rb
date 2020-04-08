class User < ApplicationRecord
  before_save :email_downcase
  before_destroy :keep_one_admin
  validates :email, presence: true, uniqueness: true, format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password
  has_many :tasks, dependent: :destroy

  enum role: %i(normal admin)

  def email_downcase
    self.email = email.downcase
  end

  def admin?
    role == 'admin'
  end

  def keep_one_admin
    return unless admin?
    if User.where(role: :admin).count == 1
      errors.add(:base, I18n.t('users.keep_one_admin'))
      throw :abort
    end
  end
end
