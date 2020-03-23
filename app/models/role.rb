class Role < ApplicationRecord
  def add_role (role)
    unless send("#{role}?")
      roles << Role.find_by(name: role)
    end
  end
  def remove_role(role)
    if send("#{role}?")
      roles.delete(Role.find_by(name: role))
    end
  end
end
