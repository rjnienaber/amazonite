module Amazonite::SsmV1
  class ListCloudConnectorsRequest
    include JSON::Serializable

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(CloudConnectorFilter) | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(CloudConnectorFilter) | Nil = nil,
    )
    end
  end
end
