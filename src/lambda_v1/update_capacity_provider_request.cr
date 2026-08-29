module Amazonite::LambdaV1
  class UpdateCapacityProviderRequest
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    @[JSON::Field(key: "CapacityProviderScalingConfig")]
    property capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil

    @[JSON::Field(key: "PropagateTags")]
    property propagate_tags : PropagateTags | Nil

    @[JSON::Field(key: "TelemetryConfig")]
    property telemetry_config : CapacityProviderTelemetryConfig | Nil

    def initialize(
      @capacity_provider_name : String,
      @capacity_provider_scaling_config : CapacityProviderScalingConfig | Nil = nil,
      @propagate_tags : PropagateTags | Nil = nil,
      @telemetry_config : CapacityProviderTelemetryConfig | Nil = nil,
    )
    end
  end
end
