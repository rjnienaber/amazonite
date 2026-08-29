module Amazonite::SsmV1
  class ConfigurationTargets
    include JSON::Serializable

    @[JSON::Field(key: "Subscriptions")]
    property subscriptions : Array(AzureSubscription) | Nil

    def initialize(
      @subscriptions : Array(AzureSubscription) | Nil = nil,
    )
    end
  end
end
