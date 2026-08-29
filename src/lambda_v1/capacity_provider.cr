private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # A capacity provider manages compute resources for Lambda functions.
  class CapacityProvider
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the capacity provider.
    @[JSON::Field(key: "CapacityProviderArn")]
    property capacity_provider_arn : String

    # The current state of the capacity provider.
    @[JSON::Field(key: "State", converter: AL::CapacityProviderState)]
    property state : CapacityProviderState

    # The VPC configuration for the capacity provider.
    @[JSON::Field(key: "VpcConfig")]
    property vpc_config : CapacityProviderVpcConfig

    # The permissions configuration for the capacity provider.
    @[JSON::Field(key: "PermissionsConfig")]
    property permissions_config : CapacityProviderPermissionsConfig

    # The instance requirements for compute resources managed by the capacity provider.
    @[JSON::Field(key: "InstanceRequirements")]
    property instance_requirements : InstanceRequirements | Nil

    # The scaling configuration for the capacity provider.
    @[JSON::Field(key: "CapacityProviderScalingConfig")]
    property capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil

    # The ARN of the KMS key used to encrypt the capacity provider's resources.
    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String | Nil

    # The date and time when the capacity provider was last modified.
    @[JSON::Field(key: "LastModified")]
    property last_modified : String | Nil

    @[JSON::Field(key: "PropagateTags")]
    property propagate_tags : PropagateTags | Nil

    # The telemetry configuration for the capacity provider, including logging settings.
    @[JSON::Field(key: "TelemetryConfig")]
    property telemetry_config : CapacityProviderTelemetryConfig | Nil

    def initialize(
      @capacity_provider_arn : String,
      @state : CapacityProviderState,
      @vpc_config : CapacityProviderVpcConfig,
      @permissions_config : CapacityProviderPermissionsConfig,
      @instance_requirements : InstanceRequirements | Nil = nil,
      @capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @last_modified : String | Nil = nil,
      @propagate_tags : PropagateTags | Nil = nil,
      @telemetry_config : CapacityProviderTelemetryConfig | Nil = nil,
    )
    end
  end
end
