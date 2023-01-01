private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class SessionFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::SessionFilterKey)]
    property key : SessionFilterKey

    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : SessionFilterKey,
      @value : String
    )
    end
  end
end
