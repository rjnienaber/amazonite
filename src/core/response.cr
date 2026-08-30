module Amazonite::Core
  # The response from a client operation that returns no data (e.g. a
  # 204) - `http` is the raw HTTP response. `ParsedResponse` extends this
  # for operations that do return an output shape.
  class Response
    getter http

    def initialize(@http : HTTP::Client::Response)
    end
  end
end
