module Amazonite::CloudWatchV1
  class GetMetricWidgetImageInput
    include JSON::Serializable

    @[JSON::Field(key: "MetricWidget")]
    property metric_widget : String

    @[JSON::Field(key: "OutputFormat")]
    property output_format : String | Nil

    def initialize(
      @metric_widget : String,
      @output_format : String | Nil = nil,
    )
    end
  end
end
