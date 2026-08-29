module Amazonite::CloudWatchV1
  class DeleteMetricStreamInput
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
