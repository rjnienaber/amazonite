module Amazonite::LambdaV1
  # The VPC security groups and subnets that are attached to a Lambda function.
  class VpcConfigResponse
    include JSON::Serializable

    # A list of VPC subnet IDs.
    @[JSON::Field(key: "SubnetIds")]
    property subnet_ids : Array(String) | Nil

    # A list of VPC security group IDs.
    @[JSON::Field(key: "SecurityGroupIds")]
    property security_group_ids : Array(String) | Nil

    # The ID of the VPC.
    @[JSON::Field(key: "VpcId")]
    property vpc_id : String | Nil

    # Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets.
    @[JSON::Field(key: "Ipv6AllowedForDualStack")]
    property ipv_6_allowed_for_dual_stack : Bool | Nil

    def initialize(
      @subnet_ids : Array(String) | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @ipv_6_allowed_for_dual_stack : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@subnet_ids, @security_group_ids, @vpc_id, @ipv_6_allowed_for_dual_stack)
  end
end
