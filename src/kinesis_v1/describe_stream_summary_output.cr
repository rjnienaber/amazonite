module Amazonite::KinesisV1
  class DescribeStreamSummaryOutput
    include JSON::Serializable

    # A StreamDescriptionSummary containing information about the stream.
    @[JSON::Field(key: "StreamDescriptionSummary")]
    property stream_description_summary : StreamDescriptionSummary

    def initialize(
      @stream_description_summary : StreamDescriptionSummary,
    )
    end
  end
end
