module Amazonite::CloudWatchLogsV1
  class StopQueryRequest
    include JSON::Serializable

    # The ID number of the query to stop. To find this ID number, use `DescribeQueries`.
    @[JSON::Field(key: "queryId")]
    property query_id : String

    def initialize(
      @query_id : String,
    )
    end

    def_equals_and_hash(@query_id)
  end
end
