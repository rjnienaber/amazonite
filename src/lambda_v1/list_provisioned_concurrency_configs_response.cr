module Amazonite::LambdaV1
  class ListProvisionedConcurrencyConfigsResponse
    include JSON::Serializable

    @[JSON::Field(key: "ProvisionedConcurrencyConfigs")]
    property provisioned_concurrency_configs : Array(ProvisionedConcurrencyConfigListItem) | Nil

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @provisioned_concurrency_configs : Array(ProvisionedConcurrencyConfigListItem) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end
  end
end
