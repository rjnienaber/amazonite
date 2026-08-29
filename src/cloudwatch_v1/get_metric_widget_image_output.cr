private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricWidgetImageOutput
    include JSON::Serializable

    @[JSON::Field(key: "MetricWidgetImage", converter: Core::Base64Converter)]
    property metric_widget_image : Bytes | Nil

    def initialize(
      @metric_widget_image : Bytes | Nil = nil,
    )
    end
  end
end
