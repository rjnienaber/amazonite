module Amazonite::Core
  class ResponseException < Exception
    getter http

    def initialize(@http : HTTP::Client::Response, message : String? = nil, cause : Exception? = nil)
      super(message, cause)
    end
  end
end
