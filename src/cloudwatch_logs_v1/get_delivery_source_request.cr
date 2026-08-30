module Amazonite::CloudWatchLogsV1
  class GetDeliverySourceRequest
    include JSON::Serializable

    # The name of the delivery source that you want to retrieve.
    @[JSON::Field(key: "name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
