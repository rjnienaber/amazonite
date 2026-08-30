private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class PutMetricDataInput
    include JSON::Serializable

    # The namespace for the metric data. You can use ASCII characters for the namespace, except for
    # control characters which are not supported.
    #
    # To avoid conflicts with Amazon Web Services service namespaces, you should not specify a
    # namespace that begins with `AWS/`
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The data for the metrics. Use this parameter if your metrics do not contain associated entities.
    # The array can include no more than 1000 metrics per call.
    #
    # The limit of metrics allowed, 1000, is the sum of both `EntityMetricData` and `MetricData`
    # metrics.
    @[JSON::Field(key: "MetricData")]
    property metric_data : Array(MetricDatum) | Nil

    # Data for metrics that contain associated entity information. You can include up to two
    # `EntityMetricData` objects, each of which can contain a single `Entity` and associated metrics.
    #
    # The limit of metrics allowed, 1000, is the sum of both `EntityMetricData` and `MetricData`
    # metrics.
    @[JSON::Field(key: "EntityMetricData")]
    property entity_metric_data : Array(EntityMetricData) | Nil

    # Whether to accept valid metric data when an invalid entity is sent.
    #
    # - When set to `true`: Any validation error (for entity or metric data) will fail the entire
    # request, and no data will be ingested. The failed operation will return a 400 result with the
    # error.
    #
    # - When set to `false`: Validation errors in the entity will not associate the metric with the
    # entity, but the metric data will still be accepted and ingested. Validation errors in the metric
    # data will fail the entire request, and no data will be ingested.
    #
    # In the case of an invalid entity, the operation will return a `200` status, but an additional
    # response header will contain information about the validation errors. The new header,
    # `X-Amzn-Failure-Message` is an enumeration of the following values:
    #
    # - `InvalidEntity` - The provided entity is invalid.
    #
    # - `InvalidKeyAttributes` - The provided `KeyAttributes` of an entity is invalid.
    #
    # - `InvalidAttributes` - The provided `Attributes` of an entity is invalid.
    #
    # - `InvalidTypeValue` - The provided `Type` in the `KeyAttributes` of an entity is invalid.
    #
    # - `EntitySizeTooLarge` - The number of `EntityMetricData` objects allowed is 2.
    #
    # - `MissingRequiredFields` - There are missing required fields in the `KeyAttributes` for the
    # provided `Type`.
    #
    # For details of the requirements for specifying an entity, see [How to add related information to
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html)
    # in the *CloudWatch User Guide*.
    #
    # This parameter is *required* when `EntityMetricData` is included.
    @[JSON::Field(key: "StrictEntityValidation")]
    property strict_entity_validation : Bool | Nil

    def initialize(
      @namespace : String,
      @metric_data : Array(MetricDatum) | Nil = nil,
      @entity_metric_data : Array(EntityMetricData) | Nil = nil,
      @strict_entity_validation : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @metric_data
        value.each(&.validate!)
      end

      if value = @entity_metric_data
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@namespace, @metric_data, @entity_metric_data, @strict_entity_validation)
  end
end
