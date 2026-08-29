module Amazonite::CloudWatchV1
  class PutMetricStreamOutput
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end
  end
end
