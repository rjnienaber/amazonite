module Amazonite::SsmV1
  class ListCloudConnectorsResult
    include JSON::Serializable

    # A list of cloud connector summary objects.
    @[JSON::Field(key: "CloudConnectors")]
    property cloud_connectors : Array(CloudConnectorSummary) | Nil

    # The token to use when requesting the next set of items.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @cloud_connectors : Array(CloudConnectorSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
