private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class OpsFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Type", converter: AS::OpsFilterOperatorType)]
    property type : OpsFilterOperatorType | Nil

    def initialize(
      @key : String,
      @values : Array(String),
      @type : OpsFilterOperatorType | Nil = nil
    )
    end
  end
end
