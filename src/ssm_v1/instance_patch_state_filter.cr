private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InstancePatchStateFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : String

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    @[JSON::Field(key: "Type", converter: AS::InstancePatchStateOperatorType)]
    property type : InstancePatchStateOperatorType

    def initialize(
      @key : String,
      @values : Array(String),
      @type : InstancePatchStateOperatorType
    )
    end
  end
end
