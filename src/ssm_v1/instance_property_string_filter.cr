private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
