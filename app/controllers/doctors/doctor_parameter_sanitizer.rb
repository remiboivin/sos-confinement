class Doctor::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :name, :specialty, :adeli, :login, :is_valid])
  end
end
