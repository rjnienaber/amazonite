private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # The target resources in the third-party cloud environment.
  class ConfigurationTargets
    include JSON::Serializable

    # A list of Azure subscriptions to target.
    @[JSON::Field(key: "Subscriptions")]
    property subscriptions : Array(AzureSubscription) | Nil

    def initialize(
      @subscriptions : Array(AzureSubscription) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @subscriptions
        raise Core::ValidationError.new("Subscriptions must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Subscriptions must have at most 75 item(s)") if value.size > 75
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@subscriptions)
  end
end
