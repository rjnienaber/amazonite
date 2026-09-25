private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Returns the current resource metrics configuration for the specified resource.
  class GetResourceMetricsConfigurationOutput
    include JSON::Serializable

    # The resource metrics configuration for the specified resource.
    @[JSON::Field(key: "ResourceMetricsConfiguration")]
    property resource_metrics_configuration : ResourceMetricsConfiguration

    def initialize(
      @resource_metrics_configuration : ResourceMetricsConfiguration,
    )
    end

    def validate! : Nil
      if value = @resource_metrics_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@resource_metrics_configuration)
  end
end
