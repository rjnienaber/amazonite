module Amazonite::SsmV1
  # Information about an Azure subscription targeted by the cloud connector.
  class AzureSubscription
    include JSON::Serializable

    # The ID of the Azure subscription.
    @[JSON::Field(key: "Id")]
    property id : String

    # The display name of the Azure subscription.
    @[JSON::Field(key: "DisplayName")]
    property display_name : String | Nil

    def initialize(
      @id : String,
      @display_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@id, @display_name)
  end
end
