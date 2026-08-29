module Amazonite::EventBridgeV1
  class DeleteEndpointRequest
    include JSON::Serializable

    # The name of the endpoint you want to delete. For example,
    # `"Name":"us-east-2-custom_bus_A-endpoint"`..
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
