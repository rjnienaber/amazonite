private alias AS = Amazonite::SsmV1

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

    def_equals_and_hash(@key, @values, @type)
  end
end
