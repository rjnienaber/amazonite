private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  # A `GetMetricData` call returns an array of `MetricDataResult` structures. Each of these
  # structures includes the data points for that metric, along with the timestamps of those data
  # points and other identifying information.
  class MetricDataResult
    include JSON::Serializable

    # The short name you specified to represent this metric.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The human-readable label associated with the data.
    @[JSON::Field(key: "Label")]
    property label : String | Nil

    # The timestamps for the data points, formatted in Unix timestamp format. The number of timestamps
    # always matches the number of values and the value for Timestamps[x] is Values[x].
    @[JSON::Field(key: "Timestamps")]
    property timestamps : Array(Time) | Nil

    # The data points for the metric corresponding to `Timestamps`. The number of values always
    # matches the number of timestamps and the timestamp for Values[x] is Timestamps[x].
    @[JSON::Field(key: "Values")]
    property values : Array(Float64) | Nil

    # The status of the returned data. `Complete` indicates that all data points in the requested time
    # range were returned. `PartialData` means that an incomplete set of data points were returned.
    # You can use the `NextToken` value that was returned and repeat your request to get more data
    # points. `NextToken` is not returned if you are performing a math expression. `InternalError`
    # indicates that an error occurred. Retry your request using `NextToken`, if present.
    @[JSON::Field(key: "StatusCode", converter: ACW::StatusCode)]
    property status_code : StatusCode | Nil

    # A list of messages with additional information about the data returned.
    @[JSON::Field(key: "Messages")]
    property messages : Array(MessageData) | Nil

    def initialize(
      @id : String | Nil = nil,
      @label : String | Nil = nil,
      @timestamps : Array(Time) | Nil = nil,
      @values : Array(Float64) | Nil = nil,
      @status_code : StatusCode | Nil = nil,
      @messages : Array(MessageData) | Nil = nil,
    )
    end

    def_equals_and_hash(@id, @label, @timestamps, @values, @status_code, @messages)
  end
end
