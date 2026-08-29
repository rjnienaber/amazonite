module Amazonite::LambdaV1
  class CapacityProviderVpcConfig
    include JSON::Serializable

    @[JSON::Field(key: "SubnetIds")]
    property subnet_ids : Array(String) = [] of String

    @[JSON::Field(key: "SecurityGroupIds")]
    property security_group_ids : Array(String) = [] of String

    def initialize(
      @subnet_ids : Array(String),
      @security_group_ids : Array(String),
    )
    end
  end
end
