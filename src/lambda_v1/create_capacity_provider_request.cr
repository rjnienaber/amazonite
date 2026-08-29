module Amazonite::LambdaV1
  class CreateCapacityProviderRequest
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderName")]
    property capacity_provider_name : String

    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : CapacityProviderVpcConfig

    @[JSON::Field(key: "PermissionsConfig")]
    property permissions_config : CapacityProviderPermissionsConfig

    @[JSON::Field(key: "InstanceRequirements")]
    property instance_requirements : InstanceRequirements | Nil

    @[JSON::Field(key: "CapacityProviderScalingConfig")]
    property capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil

    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    @[JSON::Field(key: "PropagateTags")]
    property propagate_tags : PropagateTags | Nil

    @[JSON::Field(key: "TelemetryConfig")]
    property telemetry_config : CapacityProviderTelemetryConfig | Nil

    def initialize(
      @capacity_provider_name : String,
      @vpc_config : CapacityProviderVpcConfig,
      @permissions_config : CapacityProviderPermissionsConfig,
      @instance_requirements : InstanceRequirements | Nil = nil,
      @capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @propagate_tags : PropagateTags | Nil = nil,
      @telemetry_config : CapacityProviderTelemetryConfig | Nil = nil,
    )
    end
  end
end
