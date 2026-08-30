private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class ListMetricsInput
    include JSON::Serializable

    # The metric namespace to filter against. Only the namespace that matches exactly will be
    # returned.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The name of the metric to filter against. Only the metrics with names that match exactly will be
    # returned.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The dimensions to filter against. Only the dimension with names that match exactly will be
    # returned. If you specify one dimension name and a metric has that dimension and also other
    # dimensions, it will be returned.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(DimensionFilter) | Nil

    # The token returned by a previous call to indicate that there is more data available.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # To filter the results to show only metrics that have had data points published in the past three
    # hours, specify this parameter with a value of `PT3H`. This is the only valid value for this
    # parameter.
    #
    # The results that are returned are an approximation of the value you specify. There is a low
    # probability that the returned results include metrics with last published data as much as 50
    # minutes more than the specified time interval.
    @[JSON::Field(key: "RecentlyActive", converter: ACW::RecentlyActive)]
    property recently_active : RecentlyActive | Nil

    # If you are using this operation in a monitoring account, specify `true` to include metrics from
    # source accounts in the returned data.
    #
    # The default is `false`.
    @[JSON::Field(key: "IncludeLinkedAccounts")]
    property include_linked_accounts : Bool | Nil

    # When you use this operation in a monitoring account, use this field to return metrics only from
    # one source account. To do so, specify that source account ID in this field, and also specify
    # `true` for `IncludeLinkedAccounts`.
    @[JSON::Field(key: "OwningAccount")]
    property owning_account : String | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(DimensionFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @recently_active : RecentlyActive | Nil = nil,
      @include_linked_accounts : Bool | Nil = nil,
      @owning_account : String | Nil = nil,
    )
    end
  end
end
