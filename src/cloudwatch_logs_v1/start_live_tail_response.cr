private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @response_stream
        value.validate!
      end
    end

    def_equals_and_hash(@response_stream)
  end
end
