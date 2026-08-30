module Amazonite::Core
  # Raised when a client operation gets a non-2xx response - `http` is the
  # raw HTTP response and `code` is the service's error type/code, if one
  # was present. Every generated service module defines its own
  # subclasses per exception type declared by that service's API.
  class ResponseException < Exception
    getter http, code

    def initialize(@http : HTTP::Client::Response, message : String? = nil, @code : String? = nil)
      super(message)
    end
  end

  # Raised for a generic validation error not tied to a specific
  # service-declared exception type.
  class ValidationException < ResponseException
  end

  # Raised when a request body exceeds AWS's 1 MB request size limit.
  class RequestEntityTooLarge < ResponseException
    def initialize(@http : HTTP::Client::Response, message : String? = nil, @code : String? = nil)
      super
      @message ||= "Request body must be less than 1 MB"
    end
  end
end
