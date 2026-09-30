private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class DescribeAnomalyDetectorsInput
    include JSON::Serializable

    # Specifies the unique identifiers of the anomaly detectors to describe. You can specify up to 50
    # identifiers. If you specify this parameter, you cannot also specify the `Namespace`,
    # `MetricName`, `Dimensions`, or `AnomalyDetectorTypes` metric filters.
    @[JSON::Field(key: "AnomalyDetectorIds")]
    property anomaly_detector_ids : Array(String) | Nil

    # Use the token returned by the previous operation to request the next page of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of results to return in one operation. The maximum value that you can specify
    # is 100.
    #
    # To retrieve the remaining results, make another call with the returned `NextToken` value.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # Limits the results to only the anomaly detection models that are associated with the specified
    # namespace.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # Limits the results to only the anomaly detection models that are associated with the specified
    # metric name. If there are multiple metrics with this name in different namespaces that have
    # anomaly detection models, they're all returned.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # Limits the results to only the anomaly detection models that are associated with the specified
    # metric dimensions. If there are multiple metrics that have these dimensions and have anomaly
    # detection models associated, they're all returned.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The anomaly detector types to request when using `DescribeAnomalyDetectorsInput`. If empty,
    # defaults to `SINGLE_METRIC`.
    @[JSON::Field(key: "AnomalyDetectorTypes", converter: Core::ArrayConverter(ACW::AnomalyDetectorType))]
    property anomaly_detector_types : Array(AnomalyDetectorType) | Nil

    def initialize(
      @anomaly_detector_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @anomaly_detector_types : Array(AnomalyDetectorType) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @anomaly_detector_ids
        raise Core::ValidationError.new("AnomalyDetectorIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AnomalyDetectorIds must have at most 50 item(s)") if value.size > 50
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
      end

      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @metric_name
        raise Core::ValidationError.new("MetricName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MetricName length must be <= 255") if value.size > 255
      end

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Dimensions must have at most 30 item(s)") if value.size > 30
        value.each(&.validate!)
      end

      if value = @anomaly_detector_types
        raise Core::ValidationError.new("AnomalyDetectorTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AnomalyDetectorTypes must have at most 2 item(s)") if value.size > 2
      end
    end

    def_equals_and_hash(@anomaly_detector_ids, @next_token, @max_results, @namespace, @metric_name, @dimensions, @anomaly_detector_types)
  end
end
