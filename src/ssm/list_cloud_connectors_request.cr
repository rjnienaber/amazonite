private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxResults value must be <= 10") if value > 10
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 2 item(s)") if value.size > 2
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@max_results, @next_token, @filters)
  end
end
