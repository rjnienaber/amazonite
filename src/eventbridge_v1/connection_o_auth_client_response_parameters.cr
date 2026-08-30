private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # The client response parameters for the connection when OAuth is specified as the authorization
  # type.
  class ConnectionOAuthClientResponseParameters
    include JSON::Serializable

    # The client ID associated with the response to the connection request.
    @[JSON::Field(key: "ClientID")]
    property client_id : String | Nil

    def initialize(
      @client_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @client_id
        raise Core::ValidationError.new("ClientID length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientID length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ClientID does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@client_id)
  end
end
