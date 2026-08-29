module Amazonite::LambdaV1
  class VpcConfig
    include JSON::Serializable

    @[JSON::Field(key: "SubnetIds")]
    property subnet_ids : Array(String) | Nil

    @[JSON::Field(key: "SecurityGroupIds")]
    property security_group_ids : Array(String) | Nil

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
