module Amazonite::EventBridgeV1
  # The Basic authorization parameters for the connection.
  class UpdateConnectionBasicAuthRequestParameters
    include JSON::Serializable

    # The user name to use for Basic authorization.
    @[JSON::Field(key: "Username")]
    property username : String | Nil

    # The password associated with the user name to use for Basic authorization.
    @[JSON::Field(key: "Password")]
    property password : String | Nil

    def initialize(
      @username : String | Nil = nil,
      @password : String | Nil = nil,
    )
    end

    def_equals_and_hash(@username, @password)
  end
end
