private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetOTelEnrichmentOutput
    include JSON::Serializable

    # The status of OTel enrichment for the account. Valid values are `Running` (enrichment is
    # enabled) and `Stopped` (enrichment is disabled).
    @[JSON::Field(key: "Status", converter: ACW::OTelEnrichmentStatus)]
    property status : OTelEnrichmentStatus

    # The metric namespaces, and the metric names, that are enriched. This parameter is omitted when
    # enrichment is stopped, and when enrichment is running with no include filters, which means that
    # every supported namespace is in scope.
    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(OTelEnrichmentMetricSelector) | Nil

    # The metric namespaces, and the metric names, that are left unenriched. This parameter is omitted
    # when enrichment is stopped, and when enrichment is running with no exclude filters, which means
    # that nothing is excluded.
    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(OTelEnrichmentMetricSelector) | Nil

    # The date and time that enrichment started for the account. This parameter is omitted when
    # enrichment is stopped.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

    # The date and time that the enrichment configuration for the account was last stored.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time | Nil

    def initialize(
      @status : OTelEnrichmentStatus,
      @include_filters : Array(OTelEnrichmentMetricSelector) | Nil = nil,
      @exclude_filters : Array(OTelEnrichmentMetricSelector) | Nil = nil,
      @created_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
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

    def_equals_and_hash(@status, @include_filters, @exclude_filters, @created_at, @updated_at)
  end
end
