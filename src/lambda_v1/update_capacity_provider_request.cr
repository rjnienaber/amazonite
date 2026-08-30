private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateCapacityProviderRequest
    include JSON::Serializable

    # The name of the capacity provider to update.
    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    # The updated scaling configuration for the capacity provider.
    @[JSON::Field(key: "CapacityProviderScalingConfig")]
    property capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil

    @[JSON::Field(key: "PropagateTags")]
    property propagate_tags : PropagateTags | Nil

    # The updated telemetry configuration for the capacity provider.
    @[JSON::Field(key: "TelemetryConfig")]
    property telemetry_config : CapacityProviderTelemetryConfig | Nil

    def initialize(
      @capacity_provider_name : String,
      @capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil = nil,
      @propagate_tags : PropagateTags | Nil = nil,
      @telemetry_config : CapacityProviderTelemetryConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @capacity_provider_name
        raise Core::ValidationError.new("CapacityProviderName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @capacity_provider_scaling_config
        value.validate!
      end

      if value = @propagate_tags
        value.validate!
      end

      if value = @telemetry_config
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_provider_name, @capacity_provider_scaling_config, @propagate_tags, @telemetry_config)
  end
end
