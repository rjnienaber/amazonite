private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListLogGroupsForQueryRequest
    include JSON::Serializable

    # The ID of the query to use. This query ID is from the response to your
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # operation.
    @[JSON::Field(key: "queryId")]
    property query_id : String

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Limits the number of returned log groups to the specified number.
    @[JSON::Field(key: "maxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @query_id : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @max_results
        raise Core::ValidationError.new("maxResults value must be >= 50") if value < 50
        raise Core::ValidationError.new("maxResults value must be <= 500") if value > 500
      end
    end

    def_equals_and_hash(@query_id, @next_token, @max_results)
  end
end
