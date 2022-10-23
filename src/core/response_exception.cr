module Amazonite::Core
  class ResponseException < Exception
    getter http, code

    def initialize(@http : HTTP::Client::Response, message : String? = nil, @code : String | Nil = nil)
      super(message)
    end
  end

  class ValidationException < ResponseException
  end

  class RequestEntityTooLarge < ResponseException
    def initialize(@http : HTTP::Client::Response, message : String? = nil, @code : String | Nil = nil)
      super
      @message ||= "Request body must be less than 1 MB"
    end
  end
end
