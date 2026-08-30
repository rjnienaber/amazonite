require "./response"

module Amazonite::Core
  # The response from a client operation that returns data - `result` is
  # the operation's parsed output shape (type `T`); `http` (inherited from
  # `Response`) is the raw HTTP response.
  class ParsedResponse(T) < Response
    @result : T

    getter result

    # Parses `result` as `T` from the raw response body.
    def initialize(http : HTTP::Client::Response)
      super(http)
      @result = T.from_json(http.body)
    end

    # rest-json operations whose output binds members to headers, the
    # status code, or a raw payload build the result themselves (rather
    # than parsing it whole from a JSON body) and hand it in directly.
    def initialize(http : HTTP::Client::Response, @result : T)
      super(http)
    end
  end
end
