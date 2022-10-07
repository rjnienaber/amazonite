module Amazonite::Core
  class Response
    getter http

    def initialize(@http : HTTP::Client::Response)
    end
  end
end

