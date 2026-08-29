module Amazonite::Codegen::Service
  class Operation
    private KNOWN_KEYS = ["name", "http", "input", "output", "errors", "documentation", "endpointdiscovery",
                          "endpointoperation", "idempotent", "deprecated", "deprecatedMessage", "authtype",
                          "endpoint", "auth", "staticContextParams"]

    private class Http
      getter method, request_uri, response_code

      def initialize(json : JSON::Any)
        Utils.verify_keys(["method", "requestUri", "responseCode"], json)
        @method = json["method"].as_s
        @request_uri = json["requestUri"].as_s
        @response_code = json["responseCode"].as_i
      end
    end

    # An error a operation can raise - `code` is the string an awsQuery
    # service's XML error response actually identifies the error by, which
    # can differ from `name` (the generated exception class name); it
    # defaults to `name` for every other protocol, where they're the same.
    class ErrorRef
      getter name, code

      def initialize(@name : String, @code : String)
      end
    end

    getter name, http, input, output, errors

    def initialize(json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      @name = json["name"].as_s
      @http = Http.new(json["http"])
      @input = json["input"]? ? json["input"]["shape"].as_s : nil
      @output = json["output"]? ? json["output"]["shape"].as_s : nil
      @errors = json["errors"]? ? json["errors"].as_a.map { |e| error_ref(e) } : [] of ErrorRef
    end

    private def error_ref(json : JSON::Any) : ErrorRef
      name = json["shape"].as_s
      ErrorRef.new(name, json["queryErrorCode"]?.try(&.as_s) || name)
    end

    def lower_name
      Utils.snake_case_name(name)
    end
  end
end
