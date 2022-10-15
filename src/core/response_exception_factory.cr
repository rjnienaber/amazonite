module Amazonite::Core
  module ResponseExceptionFactory
    abstract def create_exception(error_type : String | Nil, http : HTTP::Client::Response, message : String) : ResponseException | Nil
  end
end
