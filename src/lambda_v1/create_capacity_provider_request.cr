module Amazonite::LambdaV1
  class CreateCapacityProviderRequest
    include JSON::Serializable

    # The name of the capacity provider.
    @[JSON::Field(key: "CapacityProviderName")]
    property capacity_provider_name : String

    # The VPC configuration for the capacity provider, including subnet IDs and security group IDs
    # where compute instances will be launched.
    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : CapacityProviderVpcConfig

    # The permissions configuration that specifies the IAM role ARN used by the capacity provider to
    # manage compute resources.
    @[JSON::Field(key: "PermissionsConfig")]
    property permissions_config : CapacityProviderPermissionsConfig

    # The instance requirements that specify the compute instance characteristics, including
    # architectures and allowed or excluded instance types.
    @[JSON::Field(key: "InstanceRequirements")]
    property instance_requirements : InstanceRequirements | Nil

    # The scaling configuration that defines how the capacity provider scales compute instances,
    # including maximum vCPU count and scaling policies.
    @[JSON::Field(key: "CapacityProviderScalingConfig")]
    property capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil

    # The ARN of the KMS key used to encrypt data associated with the capacity provider.
    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String | Nil

    # A list of tags to associate with the capacity provider.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    # The tag propagation configuration for the capacity provider. Specifies tags to apply to managed
    # resources at launch.
    @[JSON::Field(key: "PropagateTags")]
    property propagate_tags : PropagateTags | Nil

    # The telemetry configuration for the capacity provider. Specifies logging settings for managed
    # resources.
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
