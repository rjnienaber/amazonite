private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # One or more aggregators for viewing counts of OpsData using different dimensions such as
  # `Source`, `CreatedTime`, or `Source and CreatedTime`, to name a few.
  class OpsAggregator
    include JSON::Serializable

    # Either a `Range` or `Count` aggregator for limiting an OpsData summary.
    @[JSON::Field(key: "AggregatorType")]
    property aggregator_type : String | Nil

    # The data type name to use for viewing counts of OpsData.
    @[JSON::Field(key: "TypeName")]
    property type_name : String | Nil

    # The name of an OpsData attribute on which to limit the count of OpsData.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String | Nil

    # The aggregator value.
    @[JSON::Field(key: "Values")]
    property values : Hash(String, String) | Nil

    # The aggregator filters.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsFilter) | Nil

    # A nested aggregator for viewing counts of OpsData.
    @[JSON::Field(key: "Aggregators")]
    property aggregators : Array(OpsAggregator) | Nil

    def initialize(
      @aggregator_type : String | Nil = nil,
      @type_name : String | Nil = nil,
      @attribute_name : String | Nil = nil,
      @values : Hash(String, String) | Nil = nil,
      @filters : Array(OpsFilter) | Nil = nil,
      @aggregators : Array(OpsAggregator) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @aggregator_type
        raise Core::ValidationError.new("AggregatorType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AggregatorType length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("AggregatorType does not match the required pattern") unless value.matches?(Regex.new("^(range|count|sum)$"))
      end

      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @attribute_name
        raise Core::ValidationError.new("AttributeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AttributeName length must be <= 128") if value.size > 128
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 0 entry(s)") if value.size < 0
        raise Core::ValidationError.new("Values must have at most 5 entry(s)") if value.size > 5
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @aggregators
        raise Core::ValidationError.new("Aggregators must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Aggregators must have at most 12 item(s)") if value.size > 12
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@aggregator_type, @type_name, @attribute_name, @values, @filters, @aggregators)
  end
end
