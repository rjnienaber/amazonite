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

    def_equals_and_hash(@capacity_provider_name, @capacity_provider_scaling_config, @propagate_tags, @telemetry_config)
  end
end
