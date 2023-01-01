private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class CommandFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::CommandFilterKey)]
    property key : CommandFilterKey

    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : CommandFilterKey,
      @value : String
    )
    end
  end
end
