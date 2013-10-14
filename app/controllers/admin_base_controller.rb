class AdminBaseController::ParameterSanitizer < Devise:ParameterSanitizer
  before_filter :authenticate_admin!

end