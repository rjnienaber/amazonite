private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeInstancePropertiesResult
    include JSON::Serializable

    # Properties for the managed instances.
    @[JSON::Field(key: "InstanceProperties")]
    property instance_properties : Array(InstanceProperty) | Nil

    # The token for the next set of properties to return. Use this token to get the next set of
    # results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @instance_properties : Array(InstanceProperty) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_properties
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_properties, @next_token)
  end
end
