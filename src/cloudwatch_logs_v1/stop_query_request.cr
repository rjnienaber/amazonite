private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@query_id)
  end
end
