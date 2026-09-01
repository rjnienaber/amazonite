private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The filters to describe or get information about your managed nodes.
  class InstancePropertyStringFilter
    include JSON::Serializable

    # The filter key name to describe your managed nodes.
    @[JSON::Field(key: "Key")]
    property key : String

    # The filter key name to describe your managed nodes.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    # The operator used by the filter call.
    @[JSON::Field(key: "Operator", converter: AS::InstancePropertyFilterOperator)]
    property operator : InstancePropertyFilterOperator | Nil

    def initialize(
      @key : String,
      @values : Array(String),
      @operator : InstancePropertyFilterOperator | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 100000") if value.size > 100000
      end

      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 40 item(s)") if value.size > 40
      end
    end

    def_equals_and_hash(@key, @values, @operator)
  end
end
