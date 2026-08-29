private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InstancePropertyFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::InstancePropertyFilterKey)]
    property key : InstancePropertyFilterKey

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(String) = [] of String

    def initialize(
      @key : InstancePropertyFilterKey,
      @value_set : Array(String),
    )
    end
  end
end
