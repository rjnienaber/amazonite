private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # A filter for viewing OpsData summaries.
  class OpsFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key")]
    property key : String

    # The filter value.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The type of filter.
    @[JSON::Field(key: "Type", converter: AS::OpsFilterOperatorType)]
    property type : OpsFilterOperatorType | Nil

    def initialize(
      @key : String,
      @values : Array(String),
      @type : OpsFilterOperatorType | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @values, @type)
  end
end
