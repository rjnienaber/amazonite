require "./response"

module Amazonite::Core
  class ParsedResponse(T) < Response
    @result : T

    getter result

    def initialize(http : HTTP::Client::Response)
      super(http)
      @result = T.from_json(http.body)
    end
  end
end
