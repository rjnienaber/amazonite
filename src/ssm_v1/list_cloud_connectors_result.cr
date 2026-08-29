module Amazonite::SsmV1
  class ListCloudConnectorsResult
    include JSON::Serializable

    @[JSON::Field(key: "CloudConnectors")]
    property cloud_connectors : Array(CloudConnectorSummary) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @cloud_connectors : Array(CloudConnectorSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
