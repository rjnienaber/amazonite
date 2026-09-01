private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @display_name
        raise Core::ValidationError.new("DisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("DisplayName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end
    end

    def_equals_and_hash(@id, @display_name)
  end
end
