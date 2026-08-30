private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListProvisionedConcurrencyConfigsResponse
    include JSON::Serializable

    # A list of provisioned concurrency configurations.
    @[JSON::Field(key: "ProvisionedConcurrencyConfigs")]
    property provisioned_concurrency_configs : Array(ProvisionedConcurrencyConfigListItem) | Nil

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @provisioned_concurrency_configs : Array(ProvisionedConcurrencyConfigListItem) | Nil = nil,
      @next_marker : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @provisioned_concurrency_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@provisioned_concurrency_configs, @next_marker)
  end
end
