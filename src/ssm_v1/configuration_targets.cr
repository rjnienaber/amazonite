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
  end
end
