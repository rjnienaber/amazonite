private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class TestTransformerResponse
    include JSON::Serializable

    # An array where each member of the array includes both the original version and the transformed
    # version of one of the log events that you input.
    @[JSON::Field(key: "transformedLogs")]
    property transformed_logs : Array(TransformedLogRecord) | Nil

    def initialize(
      @transformed_logs : Array(TransformedLogRecord) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @transformed_logs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transformed_logs)
  end
end
