private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 200") if value.size > 200
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 40 item(s)") if value.size > 40
      end
    end

    def_equals_and_hash(@key, @values, @type)
  end
end
