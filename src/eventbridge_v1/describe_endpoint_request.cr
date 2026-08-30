private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @home_region
        raise Core::ValidationError.new("HomeRegion length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("HomeRegion length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("HomeRegion does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-z0-9]+$"))
      end
    end

    def_equals_and_hash(@name, @home_region)
  end
end
