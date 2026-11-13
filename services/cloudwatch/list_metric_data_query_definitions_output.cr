private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class ListMetricDataQueryDefinitionsOutput
    include JSON::Serializable

    # A list of metric data query definition summaries.
    @[JSON::Field(key: "Items")]
    property items : Array(MetricDataQueryDefinitionSummary) = [] of MetricDataQueryDefinitionSummary

    # The token to use when requesting the next set of results. If this field is absent, there are no
    # more results to retrieve.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @items : Array(MetricDataQueryDefinitionSummary),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @items
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_-]+$"))
      end
    end

    def_equals_and_hash(@items, @next_token)
  end
end
