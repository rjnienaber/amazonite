private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @capacity_provider_arn
        raise Core::ValidationError.new("CapacityProviderArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderArn length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+$"))
      end

      if value = @vpc_config
        value.validate!
      end

      if value = @permissions_config
        value.validate!
      end

      if value = @instance_requirements
        value.validate!
      end

      if value = @capacity_provider_scaling_config
        value.validate!
      end

      if value = @kms_key_arn
        raise Core::ValidationError.new("KmsKeyArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("KmsKeyArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end

      if value = @last_modified
        raise Core::ValidationError.new("LastModified length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LastModified length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("LastModified does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end

      if value = @propagate_tags
        value.validate!
      end

      if value = @telemetry_config
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_provider_arn, @state, @vpc_config, @permissions_config, @instance_requirements, @capacity_provider_scaling_config, @kms_key_arn, @last_modified, @propagate_tags, @telemetry_config)
  end
end
