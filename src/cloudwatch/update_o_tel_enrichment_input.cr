private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class UpdateOTelEnrichmentInput
    include JSON::Serializable

    # The metric namespaces, and the metric names, to enrich. If this parameter is omitted, every
    # namespace that Amazon CloudWatch supports for enrichment is in scope.
    #
    # A maximum of 100 filters is allowed across `IncludeFilters` and `ExcludeFilters` combined.
    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(OTelEnrichmentMetricSelector) | Nil

    # The metric namespaces, and the metric names, to leave unenriched. If this parameter is omitted,
    # nothing is excluded.
    #
    # Amazon CloudWatch applies `ExcludeFilters` after `IncludeFilters`, so a metric that both
    # parameters match is not enriched.
    #
    # A maximum of 100 filters is allowed across `IncludeFilters` and `ExcludeFilters` combined.
    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(OTelEnrichmentMetricSelector) | Nil

    def initialize(
      @include_filters : Array(OTelEnrichmentMetricSelector) | Nil = nil,
      @exclude_filters : Array(OTelEnrichmentMetricSelector) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @include_filters
        raise Core::ValidationError.new("IncludeFilters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("IncludeFilters must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @exclude_filters
        raise Core::ValidationError.new("ExcludeFilters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ExcludeFilters must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@include_filters, @exclude_filters)
  end
end
