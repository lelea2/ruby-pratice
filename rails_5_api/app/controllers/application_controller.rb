class ApplicationController < ActionController::API

  include ActionController::Serialization

  Swagger::Docs::Generator::set_real_methods

end
