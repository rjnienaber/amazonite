private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PutParameterResult
    include JSON::Serializable

    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    @[JSON::Field(key: "Tier", converter: AS::ParameterTier)]
    property tier : ParameterTier | Nil

    def initialize(
      @version : Int64 | Nil = nil,
      @tier : ParameterTier | Nil = nil
    )
    end
  end
end
