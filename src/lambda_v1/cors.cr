private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # The [cross-origin resource sharing
  # (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) settings for your Lambda
  # function URL. Use CORS to grant access to your function URL from any origin. You can also use
  # CORS to control access for specific HTTP headers and methods in requests to your function URL.
  class Cors
    include JSON::Serializable

    # Whether to allow cookies or other credentials in requests to your function URL. The default is
    # `false`.
    @[JSON::Field(key: "AllowCredentials")]
    property allow_credentials : Bool | Nil

    # The HTTP headers that origins can include in requests to your function URL. For example: `Date`,
    # `Keep-Alive`, `X-Custom-Header`.
    @[JSON::Field(key: "AllowHeaders")]
    property allow_headers : Array(String) | Nil

    # The HTTP methods that are allowed when calling your function URL. For example: `GET`, `POST`,
    # `DELETE`, or the wildcard character (`*`).
    @[JSON::Field(key: "AllowMethods")]
    property allow_methods : Array(String) | Nil

    # The origins that can access your function URL. You can list any number of specific origins,
    # separated by a comma. For example: `https://www.example.com`, `http://localhost:60905`.
    #
    # Alternatively, you can grant access to all origins using the wildcard character (`*`).
    @[JSON::Field(key: "AllowOrigins")]
    property allow_origins : Array(String) | Nil

    # The HTTP headers in your function response that you want to expose to origins that call your
    # function URL. For example: `Date`, `Keep-Alive`, `X-Custom-Header`.
    @[JSON::Field(key: "ExposeHeaders")]
    property expose_headers : Array(String) | Nil

    # The maximum amount of time, in seconds, that web browsers can cache results of a preflight
    # request. By default, this is set to `0`, which means that the browser doesn't cache results.
    @[JSON::Field(key: "MaxAge")]
    property max_age : Int32 | Nil

    def initialize(
      @allow_credentials : Bool | Nil = nil,
      @allow_headers : Array(String) | Nil = nil,
      @allow_methods : Array(String) | Nil = nil,
      @allow_origins : Array(String) | Nil = nil,
      @expose_headers : Array(String) | Nil = nil,
      @max_age : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @allow_headers
        raise Core::ValidationError.new("AllowHeaders must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AllowHeaders must have at most 100 item(s)") if value.size > 100
      end

      if value = @allow_methods
        raise Core::ValidationError.new("AllowMethods must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AllowMethods must have at most 6 item(s)") if value.size > 6
      end

      if value = @allow_origins
        raise Core::ValidationError.new("AllowOrigins must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AllowOrigins must have at most 100 item(s)") if value.size > 100
      end

      if value = @expose_headers
        raise Core::ValidationError.new("ExposeHeaders must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ExposeHeaders must have at most 100 item(s)") if value.size > 100
      end

      if value = @max_age
        raise Core::ValidationError.new("MaxAge value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxAge value must be <= 86400") if value > 86400
      end
    end

    def_equals_and_hash(@allow_credentials, @allow_headers, @allow_methods, @allow_origins, @expose_headers, @max_age)
  end
end
