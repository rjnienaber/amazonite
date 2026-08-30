private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # One or more filters. Use a filter to return a more specific list of results.
  class ComplianceStringFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value for which to search.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    # The type of comparison that should be performed for the value: Equal, NotEqual, BeginWith,
    # LessThan, or GreaterThan.
    @[JSON::Field(key: "Type", converter: AS::ComplianceQueryOperatorType)]
    property type : ComplianceQueryOperatorType | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
      @type : ComplianceQueryOperatorType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 200") if value.size > 200
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@key, @values, @type)
  end
end
