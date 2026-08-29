private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class NodeFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::NodeFilterKey)]
    property key : NodeFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    @[JSON::Field(key: "Type", converter: AS::NodeFilterOperatorType)]
    property type : NodeFilterOperatorType | Nil

    def initialize(
      @key : NodeFilterKey,
      @values : Array(String),
      @type : NodeFilterOperatorType | Nil = nil,
    )
    end
  end
end
