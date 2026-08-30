private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @query_id
        raise Core::ValidationError.new("queryId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("queryId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@query_id)
  end
end
