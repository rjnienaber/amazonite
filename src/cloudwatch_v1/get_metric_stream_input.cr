module Amazonite::CloudWatchV1
  class GetMetricStreamInput
    include JSON::Serializable

    # The name of the metric stream to retrieve information about.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
