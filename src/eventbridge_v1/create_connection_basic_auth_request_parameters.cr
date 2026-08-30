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

    def_equals_and_hash(@username, @password)
  end
end
