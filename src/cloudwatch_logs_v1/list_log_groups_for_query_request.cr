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
  end
end
