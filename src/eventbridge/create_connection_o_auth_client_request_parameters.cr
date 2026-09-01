private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # The Basic authorization parameters to use for the connection.
  class CreateConnectionOAuthClientRequestParameters
    include JSON::Serializable

    # The client ID to use for OAuth authorization for the connection.
    @[JSON::Field(key: "ClientID")]
    property client_id : String

    # The client secret associated with the client ID to use for OAuth authorization for the
    # connection.
    @[JSON::Field(key: "ClientSecret")]
    property client_secret : String

    def initialize(
      @client_id : String,
      @client_secret : String,
    )
    end

    def validate! : Nil
      if value = @client_id
        raise Core::ValidationError.new("ClientID length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientID length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ClientID does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end

      if value = @client_secret
        raise Core::ValidationError.new("ClientSecret length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientSecret length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ClientSecret does not match the required pattern") unless value.matches?(Regex.new("^[ \\t]*[^\\x00-\\x1F:\\x7F]+([ \\t]+[^\\x00-\\x1F:\\x7F]+)*[ \\t]*$"))
      end
    end

    def_equals_and_hash(@client_id, @client_secret)
  end
end
