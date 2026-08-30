module Amazonite::CloudWatchLogsV1
  class GetDeliveryRequest
    include JSON::Serializable

    # The ID of the delivery that you want to retrieve.
    @[JSON::Field(key: "id")]
    property id : String

    def initialize(
      @id : String,
    )
    end

    def_equals_and_hash(@id)
  end
end
