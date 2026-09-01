private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class DescribeStreamSummaryOutput
    include JSON::Serializable

    # A StreamDescriptionSummary containing information about the stream.
    @[JSON::Field(key: "StreamDescriptionSummary")]
    property stream_description_summary : StreamDescriptionSummary

    def initialize(
      @stream_description_summary : StreamDescriptionSummary,
    )
    end

    def validate! : Nil
      if value = @stream_description_summary
        value.validate!
      end
    end

    def_equals_and_hash(@stream_description_summary)
  end
end
