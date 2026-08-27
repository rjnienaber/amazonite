private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InstancePropertyStringFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Values")]
    property values : Array(String)

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
