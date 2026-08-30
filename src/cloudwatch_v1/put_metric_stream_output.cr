module Amazonite::CloudWatchV1
  class PutMetricStreamOutput
    include JSON::Serializable

    # The ARN of the metric stream.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@arn)
  end
end
