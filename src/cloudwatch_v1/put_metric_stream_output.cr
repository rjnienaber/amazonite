private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@arn)
  end
end
