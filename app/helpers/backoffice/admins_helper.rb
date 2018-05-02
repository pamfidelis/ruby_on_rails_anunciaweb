module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    Admin.roles.map { |key, value| OptionsForRoles.new(key,value) }
  end
end
