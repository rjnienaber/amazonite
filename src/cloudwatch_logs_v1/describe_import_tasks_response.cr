module Amazonite::CloudWatchLogsV1
  class DescribeImportTasksResponse
    include JSON::Serializable

    # The list of import tasks that match the request filters.
    @[JSON::Field(key: "imports")]
    property imports : Array(Import) | Nil

    # The token to use when requesting the next set of results. Not present if there are no additional
    # results to retrieve.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @imports : Array(Import) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
