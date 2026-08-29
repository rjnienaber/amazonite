private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # This structure specifies the VPC subnets and security groups for the task, and whether a public
  # IP address is to be used. This structure is relevant only for ECS tasks that use the `awsvpc`
  # network mode.
  class AwsVpcConfiguration
    include JSON::Serializable

    # Specifies the subnets associated with the task. These subnets must all be in the same VPC. You
    # can specify as many as 16 subnets.
    @[JSON::Field(key: "Subnets")]
    property subnets : Array(String) = [] of String

    # Specifies the security groups associated with the task. These security groups must all be in the
    # same VPC. You can specify as many as five security groups. If you do not specify a security
    # group, the default security group for the VPC is used.
    @[JSON::Field(key: "SecurityGroups")]
    property security_groups : Array(String) | Nil

    # Specifies whether the task's elastic network interface receives a public IP address. You can
    # specify `ENABLED` only when `LaunchType` in `EcsParameters` is set to `FARGATE`.
    @[JSON::Field(key: "AssignPublicIp", converter: AEB::AssignPublicIp)]
    property assign_public_ip : AssignPublicIp | Nil

    def initialize(
      @subnets : Array(String),
      @security_groups : Array(String) | Nil = nil,
      @assign_public_ip : AssignPublicIp | Nil = nil,
    )
    end
  end
end
