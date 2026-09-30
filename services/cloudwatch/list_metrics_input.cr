private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
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
        raise Core::ValidationError.new("Dimensions must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @owning_account
        raise Core::ValidationError.new("OwningAccount length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwningAccount length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@namespace, @metric_name, @dimensions, @next_token, @recently_active, @include_linked_accounts, @owning_account)
  end
end
