module Amazonite::LambdaV1
  class GetDurableExecutionHistoryRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # Specifies whether to include execution data such as step results and callback payloads in the
    # history events. Set to `true` to include data, or `false` to exclude it for a more compact
    # response. The default is `true`.
    @[JSON::Field(key: "IncludeExecutionData", ignore: true)]
    property include_execution_data : Bool | Nil

    # The maximum number of history events to return per call. You can use `Marker` to retrieve
    # additional pages of results. The default is 100 and the maximum allowed is 1000. A value of 0
    # uses the default.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    # If `NextMarker` was returned from a previous request, use this value to retrieve the next page
    # of results. Each pagination token expires after 24 hours.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # When set to `true`, returns the history events in reverse chronological order (newest first). By
    # default, events are returned in chronological order (oldest first).
    @[JSON::Field(key: "ReverseOrder", ignore: true)]
    property reverse_order : Bool | Nil

    def initialize(
      @durable_execution_arn : String,
      @include_execution_data : Bool | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @reverse_order : Bool | Nil = nil,
    )
    end
  end
end
