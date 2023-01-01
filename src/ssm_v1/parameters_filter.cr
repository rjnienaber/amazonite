private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ParametersFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::ParametersFilterKey)]
    property key : ParametersFilterKey

    @[JSON::Field(key: "Values")]
    property values : Array(String)

    def initialize(
      @key : ParametersFilterKey,
      @values : Array(String)
    )
    end
  end
end
