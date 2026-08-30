private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # The authorization parameters for the connection if Basic is specified as the authorization type.
  class ConnectionBasicAuthResponseParameters
    include JSON::Serializable

    # The user name to use for Basic authorization.
    @[JSON::Field(key: "Username")]
    property username : String | Nil

    def initialize(
      @username : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @username
        raise Core::ValidationError.new("Username length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Username length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Username does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@username)
  end
end
