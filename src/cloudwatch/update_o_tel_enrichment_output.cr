private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class UpdateOTelEnrichmentOutput
    include JSON::Serializable

    # The include filters that are stored for the account after the replacement. This parameter is
    # omitted when the request cleared the include filters, which means that every supported namespace
    # is in scope.
    @[JSON::Field(key: "IncludeFilters")]
    property include_filters : Array(OTelEnrichmentMetricSelector) | Nil

    # The exclude filters that are stored for the account after the replacement. This parameter is
    # omitted when the request cleared the exclude filters, which means that nothing is excluded.
    @[JSON::Field(key: "ExcludeFilters")]
    property exclude_filters : Array(OTelEnrichmentMetricSelector) | Nil

    # The date and time that enrichment started for the account.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time | Nil

    # The date and time that the enrichment configuration for the account was last stored.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time | Nil

    def initialize(
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

    def_equals_and_hash(@include_filters, @exclude_filters, @created_at, @updated_at)
  end
end
