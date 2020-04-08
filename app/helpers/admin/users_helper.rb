module Admin::UsersHelper
  def role_options
    User.roles.keys.map do |role|
      [role, I18n.t("views.users.role.#{role}")]
    end
  end
end
