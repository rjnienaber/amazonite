module Amazonite::CloudWatchLogsV1
  class StartQueryResponse
    include JSON::Serializable

    # The unique ID of the query.
    @[JSON::Field(key: "queryId")]
    property query_id : String | Nil

    def initialize(
      @query_id : String | Nil = nil,
    )
    end
  end
end
