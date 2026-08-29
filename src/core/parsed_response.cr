require "./response"

module Amazonite::Core
  class ParsedResponse(T) < Response
    @result : T

    getter result

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
