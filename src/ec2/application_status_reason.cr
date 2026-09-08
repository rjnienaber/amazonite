private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the reason for an application status check result.
  class ApplicationStatusReason
    # The reason code for the application status check result. Possible values:
    #
    # - `ResponseCodeMatched` – The HTTP status code returned by the health check matched the
    # configured `StatusCodeMatcher`.
    #
    # - `ResponseCodeMismatch` – The HTTP status code returned by the health check did not match the
    # configured `StatusCodeMatcher`.
    #
    # - `ConnectionTimeout` – The connection to the target timed out.
    #
    # - `ResponseTimeout` – The health check timed out while waiting for a response from the target.
    #
    # - `ConnectionRefused` – The target refused the health check connection.
    #
    # - `ConnectionReset` – The target reset the health check connection before returning a response.
    #
    # Current health check results use the values in the preceding list. Legacy results that do not
    # contain structured reason metadata can instead contain a producer error type, such as `Http
    # Status Code` or `HttpConnectTimeoutException`.
    #
    # For `ResponseCodeMatched` and `ResponseCodeMismatch`, the `statusCode` field contains the
    # returned HTTP status code. The `protocol` field contains the protocol used for the health check.
    property code : String | Nil

    # The HTTP status code returned by the health check.
    property status_code : Int32 | Nil

    # The protocol used for the health check. Possible values: `HTTP` and `HTTPS`.
    property protocol : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @status_code : Int32 | Nil = nil,
      @protocol : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value}
      end

      if value = @status_code
        params << {"#{prefix}StatusCode", value.to_s}
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
        status_code: Core::XMLValue.i32(node.xpath_node("*[local-name()='statusCode']")),
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @status_code, @protocol)
  end
end
