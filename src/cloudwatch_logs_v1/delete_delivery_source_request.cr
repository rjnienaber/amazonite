module Amazonite::CloudWatchLogsV1
  class DeleteDeliverySourceRequest
    include JSON::Serializable

    # The name of the delivery source that you want to delete.
    @[JSON::Field(key: "name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
