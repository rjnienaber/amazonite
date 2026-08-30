private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class GetMetricWidgetImageOutput
    include JSON::Serializable

    # The image of the graph, in the output format specified. The output is base64-encoded.
    @[JSON::Field(key: "MetricWidgetImage", converter: Core::Base64Converter)]
    property metric_widget_image : Bytes | Nil

    def initialize(
      @metric_widget_image : Bytes | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric_widget_image)
  end
end
