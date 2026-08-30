private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Contains the Basic authorization parameters to use for the connection.
  class CreateConnectionBasicAuthRequestParameters
    include JSON::Serializable

    # The user name to use for Basic authorization.
    @[JSON::Field(key: "Username")]
    property username : String

    # The password associated with the user name to use for Basic authorization.
    @[JSON::Field(key: "Password")]
    property password : String

    def initialize(
      @username : String,
      @password : String,
    )
    end

    def validate! : Nil
      if value = @username
        raise Core::ValidationError.new("Username length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Username length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Username does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end

      if value = @password
        raise Core::ValidationError.new("Password length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Password length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Password does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@username, @password)
  end
end
