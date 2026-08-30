module Amazonite::CloudWatchLogsV1
  class GetDeliveryDestinationRequest
    include JSON::Serializable

    # The name of the delivery destination that you want to retrieve.
    @[JSON::Field(key: "name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def_equals_and_hash(@name)
  end
end
