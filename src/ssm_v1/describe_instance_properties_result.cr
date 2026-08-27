module Amazonite::SsmV1
  class DescribeInstancePropertiesResult
    include JSON::Serializable

    @[JSON::Field(key: "InstanceProperties")]
    property instance_properties : Array(InstanceProperty) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_properties : Array(InstanceProperty) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
