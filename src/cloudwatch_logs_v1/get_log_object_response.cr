module Amazonite::CloudWatchLogsV1
  # The response from the GetLogObject operation.
  class GetLogObjectResponse
    include JSON::Serializable

    # A stream of structured log data returned by the GetLogObject operation. This stream contains log
    # events with their associated metadata and extracted fields.
    @[JSON::Field(key: "fieldStream")]
    property field_stream : GetLogObjectResponseStream | Nil

    def initialize(
      @field_stream : GetLogObjectResponseStream | Nil = nil,
    )
    end

    def_equals_and_hash(@field_stream)
  end
end
