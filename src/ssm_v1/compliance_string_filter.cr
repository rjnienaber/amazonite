private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ComplianceStringFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    @[JSON::Field(key: "Type", converter: AS::ComplianceQueryOperatorType)]
    property type : ComplianceQueryOperatorType | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
      @type : ComplianceQueryOperatorType | Nil = nil
    )
    end
  end
end
