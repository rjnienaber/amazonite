private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # VPC configuration that specifies the network settings for compute instances managed by the
  # capacity provider.
  class CapacityProviderVpcConfig
    include JSON::Serializable

    # A list of subnet IDs where the capacity provider launches compute instances.
    @[JSON::Field(key: "SubnetIds")]
    property subnet_ids : Array(String) = [] of String

    # A list of security group IDs that control network access for compute instances managed by the
    # capacity provider.
    @[JSON::Field(key: "SecurityGroupIds")]
    property security_group_ids : Array(String) = [] of String

    def initialize(
      @subnet_ids : Array(String),
      @security_group_ids : Array(String),
    )
    end

    def validate! : Nil
      if value = @subnet_ids
        raise Core::ValidationError.new("SubnetIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("SubnetIds must have at most 16 item(s)") if value.size > 16
      end

      if value = @security_group_ids
        raise Core::ValidationError.new("SecurityGroupIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SecurityGroupIds must have at most 5 item(s)") if value.size > 5
      end
    end

    def_equals_and_hash(@subnet_ids, @security_group_ids)
  end
end
