module Amazonite::CloudWatchLogsV1
  class StopQueryResponse
    include JSON::Serializable

    # This is true if the query was stopped by the `StopQuery` operation.
    @[JSON::Field(key: "success")]
    property success : Bool | Nil

    def initialize(
      @success : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@success)
  end
end
