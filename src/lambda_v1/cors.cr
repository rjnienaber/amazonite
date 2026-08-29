module Amazonite::LambdaV1
  class Cors
    include JSON::Serializable

    @[JSON::Field(key: "AllowCredentials")]
    property allow_credentials : Bool | Nil

    @[JSON::Field(key: "AllowHeaders")]
    property allow_headers : Array(String) | Nil

    @[JSON::Field(key: "AllowMethods")]
    property allow_methods : Array(String) | Nil

    @[JSON::Field(key: "AllowOrigins")]
    property allow_origins : Array(String) | Nil

    @[JSON::Field(key: "ExposeHeaders")]
    property expose_headers : Array(String) | Nil

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
  end
end
