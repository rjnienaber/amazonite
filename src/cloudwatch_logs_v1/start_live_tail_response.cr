module Amazonite::CloudWatchLogsV1
  class StartLiveTailResponse
    include JSON::Serializable

    # An object that includes the stream returned by your request. It can include both log events and
    # exceptions.
    @[JSON::Field(key: "responseStream")]
    property response_stream : StartLiveTailResponseStream | Nil

    def initialize(
      @response_stream : StartLiveTailResponseStream | Nil = nil,
    )
    end

    def_equals_and_hash(@response_stream)
  end
end
