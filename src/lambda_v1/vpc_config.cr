module Amazonite::LambdaV1
  # The VPC security groups and subnets that are attached to a Lambda function. For more
  # information, see [Configuring a Lambda function to access resources in a
  # VPC](https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html).
  class VpcConfig
    include JSON::Serializable

    # A list of VPC subnet IDs.
    @[JSON::Field(key: "SubnetIds")]
    property subnet_ids : Array(String) | Nil

    # A list of VPC security group IDs.
    @[JSON::Field(key: "SecurityGroupIds")]
    property security_group_ids : Array(String) | Nil

    # Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets.
    @[JSON::Field(key: "Ipv6AllowedForDualStack")]
    property ipv_6_allowed_for_dual_stack : Bool | Nil

    def initialize(
      @subnet_ids : Array(String) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @ipv_6_allowed_for_dual_stack : Bool | Nil = nil,
    )
    end
  end
end
