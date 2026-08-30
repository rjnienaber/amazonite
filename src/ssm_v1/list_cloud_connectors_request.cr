module Amazonite::SsmV1
  class ListCloudConnectorsRequest
    include JSON::Serializable

    # The maximum number of items to return for this call.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # One or more filters to limit the cloud connectors returned in the response.
    @[JSON::Field(key: "Filters")]
    property filters : Array(CloudConnectorFilter) | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(CloudConnectorFilter) | Nil = nil,
    )
    end

    def_equals_and_hash(@max_results, @next_token, @filters)
  end
end
