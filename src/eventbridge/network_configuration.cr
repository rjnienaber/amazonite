private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # This structure specifies the network configuration for an ECS task.
  class NetworkConfiguration
    include JSON::Serializable

    # Use this structure to specify the VPC subnets and security groups for the task, and whether a
    # public IP address is to be used. This structure is relevant only for ECS tasks that use the
    # `awsvpc` network mode.
    @[JSON::Field(key: "awsvpcConfiguration")]
    property awsvpc_configuration : AwsVpcConfiguration | Nil

    def initialize(
      @awsvpc_configuration : AwsVpcConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @awsvpc_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@awsvpc_configuration)
  end
end
