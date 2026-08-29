module Amazonite::EventBridgeV1
  class DescribeEndpointRequest
    include JSON::Serializable

    # The name of the endpoint you want to get information about. For example,
    # `"Name":"us-east-2-custom_bus_A-endpoint"`.
    @[JSON::Field(key: "Name")]
    property name : String

    # The primary Region of the endpoint you want to get information about. For example `"HomeRegion":
    # "us-east-1"`.
    @[JSON::Field(key: "HomeRegion")]
    property home_region : String | Nil

    def initialize(
      @name : String,
      @home_region : String | Nil = nil,
    )
    end
  end
end
