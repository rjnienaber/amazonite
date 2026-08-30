private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # This structure defines the metric to be returned, along with the statistics, period, and units.
  class MetricStat
    include JSON::Serializable

    # The metric to return, including the metric name, namespace, and dimensions.
    @[JSON::Field(key: "Metric")]
    property metric : Metric

    # The granularity, in seconds, of the returned data points. For metrics with regular resolution, a
    # period can be as short as one minute (60 seconds) and must be a multiple of 60. For
    # high-resolution metrics that are collected at intervals of less than one minute, the period can
    # be 1, 5, 10, 20, 30, 60, or any multiple of 60. High-resolution metrics are those metrics stored
    # by a `PutMetricData` call that includes a `StorageResolution` of 1 second.
    #
    # If the `StartTime` parameter specifies a time stamp that is greater than 3 hours ago, you must
    # specify the period as follows or no data points in that time range is returned:
    #
    # - Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1 minute).
    #
    # - Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5 minutes).
    #
    # - Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).
    @[JSON::Field(key: "Period")]
    property period : Int32

    # The statistic to return. It can include any CloudWatch statistic or extended statistic.
    @[JSON::Field(key: "Stat")]
    property stat : String

    # When you are using a `Put` operation, this defines what unit you want to use when storing the
    # metric.
    #
    # In a `Get` operation, if you omit `Unit` then all data that was collected with any unit is
    # returned, along with the corresponding units that were specified when the data was reported to
    # CloudWatch. If you specify a unit, the operation returns only data that was collected with that
    # unit specified. If you specify a unit that does not match the data collected, the results of the
    # operation are null. CloudWatch does not perform unit conversions.
    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @metric : Metric,
      @period : Int32,
      @stat : String,
      @unit : StandardUnit | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @metric
        value.validate!
      end

      if value = @period
        raise Core::ValidationError.new("Period value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@metric, @period, @stat, @unit)
  end
end
