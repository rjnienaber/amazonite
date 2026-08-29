module Amazonite::CloudWatchV1
  class DeleteMetricStreamInput
    include JSON::Serializable

    # The name of the metric stream to delete.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
