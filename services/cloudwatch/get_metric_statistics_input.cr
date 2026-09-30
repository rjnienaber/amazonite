private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetMetricStatisticsInput
    include JSON::Serializable

    # The namespace of the metric, with or without spaces.
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The name of the metric, with or without spaces.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    # The dimensions. If the metric contains multiple dimensions, you must include a value for each
    # dimension. CloudWatch treats each unique combination of dimensions as a separate metric. If a
    # specific combination of dimensions was not published, you can't retrieve statistics for it. You
    # must specify the same dimensions that were used when the metrics were created. For an example,
    # see [Dimension
    # Combinations](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations)
    # in the *Amazon CloudWatch User Guide*. For more information about specifying dimensions, see
    # [Publishing
    # Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
    # in the *Amazon CloudWatch User Guide*.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The time stamp that determines the first data point to return. Start times are evaluated
    # relative to the time that CloudWatch receives the request.
    #
    # The value specified is inclusive; results include data points with the specified time stamp. In
    # a raw HTTP query, the time stamp must be in ISO 8601 UTC format (for example,
    # 2016-10-03T23:00:00Z).
    #
    # CloudWatch rounds the specified time stamp as follows:
    #
    # - Start time less than 15 days ago - Round down to the nearest whole minute. For example,
    # 12:32:34 is rounded down to 12:32:00.
    #
    # - Start time between 15 and 63 days ago - Round down to the nearest 5-minute clock interval. For
    # example, 12:32:34 is rounded down to 12:30:00.
    #
    # - Start time greater than 63 days ago - Round down to the nearest 1-hour clock interval. For
    # example, 12:32:34 is rounded down to 12:00:00.
    #
    # If you set `Period` to 5, 10, 20, or 30, the start time of your request is rounded down to the
    # nearest time that corresponds to even 5-, 10-, 20-, or 30-second divisions of a minute. For
    # example, if you make a query at (HH:mm:ss) 01:05:23 for the previous 10-second period, the start
    # time of your request is rounded down and you receive data from 01:05:10 to 01:05:20. If you make
    # a query at 15:07:17 for the previous 5 minutes of data, using a period of 5 seconds, you receive
    # data timestamped between 15:02:15 and 15:07:15.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    # The time stamp that determines the last data point to return.
    #
    # The value specified is exclusive; results include data points up to the specified time stamp. In
    # a raw HTTP query, the time stamp must be in ISO 8601 UTC format (for example,
    # 2016-10-10T23:00:00Z).
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

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

    # The metric statistics, other than percentile. For percentile statistics, use
    # `ExtendedStatistics`. When calling `GetMetricStatistics`, you must specify either `Statistics`
    # or `ExtendedStatistics`, but not both.
    @[JSON::Field(key: "Statistics", converter: Core::ArrayConverter(ACW::Statistic))]
    property statistics : Array(Statistic) | Nil

    # The percentile statistics. Specify values between p0.0 and p100. When calling
    # `GetMetricStatistics`, you must specify either `Statistics` or `ExtendedStatistics`, but not
    # both. Percentile statistics are not available for metrics when any of the metric values are
    # negative numbers.
    @[JSON::Field(key: "ExtendedStatistics")]
    property extended_statistics : Array(String) | Nil

    # The unit for a given metric. If you omit `Unit`, all data that was collected with any unit is
    # returned, along with the corresponding units that were specified when the data was reported to
    # CloudWatch. If you specify a unit, the operation returns only data that was collected with that
    # unit specified. If you specify a unit that does not match the data collected, the results of the
    # operation are null. CloudWatch does not perform unit conversions.
    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @namespace : String,
      @metric_name : String,
      @start_time : Time,
      @end_time : Time,
      @period : Int32,
      @dimensions : Array(Dimension) | Nil = nil,
      @statistics : Array(Statistic) | Nil = nil,
      @extended_statistics : Array(String) | Nil = nil,
      @unit : StandardUnit | Nil = nil,
    )
    end

    def validate! : Nil
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

      if value = @period
        raise Core::ValidationError.new("Period value must be >= 1") if value < 1
      end

      if value = @statistics
        raise Core::ValidationError.new("Statistics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Statistics must have at most 5 item(s)") if value.size > 5
      end

      if value = @extended_statistics
        raise Core::ValidationError.new("ExtendedStatistics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ExtendedStatistics must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@namespace, @metric_name, @dimensions, @start_time, @end_time, @period, @statistics, @extended_statistics, @unit)
  end
end
