module Amazonite::Codegen::Service
  class Operation
    private KNOWN_KEYS = ["name", "http", "input", "output", "errors", "documentation", "endpointdiscovery",
                          "endpointoperation", "idempotent", "deprecated", "deprecatedMessage", "authtype",
                          "endpoint"]

    private class Http
      getter method, request_uri

      def initialize(json : JSON::Any)
        Utils.verify_keys(["method", "requestUri", "responseCode"], json)
        @method = json["method"]
        @request_uri = json["requestUri"]
      end
    end

    getter name, http, input, output, errors

    def initialize(json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      @name = json["name"].as_s
      @http = Http.new(json["http"])
      @input = json["input"]? ? json["input"]["shape"].as_s : nil
      @output = json["output"]? ? json["output"]["shape"].as_s : nil
      @errors = json["errors"]? ? json["errors"].as_a.map(&.["shape"].as_s) : [] of String
    end

    def lower_name
      Utils.snake_case_name(name)
    end
  end
end
