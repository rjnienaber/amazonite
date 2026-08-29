private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # A filter for listing cloud connectors.
  class CloudConnectorFilter
    include JSON::Serializable

    # The name of the filter key.
    @[JSON::Field(key: "FilterKey", converter: AS::CloudConnectorFilterKey)]
    property filter_key : CloudConnectorFilterKey | Nil

    # The filter values. Valid values for each filter key are as follows:
    #
    # SubscriptionId The Azure subscription ID to filter by. To return only tenant-level connectors,
    # specify `NONE`.
    #
    # TenantId The Azure tenant ID to filter by. Filters the results to connectors that target the
    # specified tenant.
    @[JSON::Field(key: "FilterValues")]
    property filter_values : Array(String) | Nil

    def initialize(
      @filter_key : CloudConnectorFilterKey | Nil = nil,
      @filter_values : Array(String) | Nil = nil,
    )
    end
  end
end
