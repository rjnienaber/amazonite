private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InstanceInformationFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::InstanceInformationFilterKey)]
    property key : InstanceInformationFilterKey

    @[JSON::Field(key: "valueSet")]
    property value_set : Array(String)

    def initialize(
      @key : InstanceInformationFilterKey,
      @value_set : Array(String)
    )
    end
  end
end
