private alias ASM = Amazonite::SecretsManagerV1

module Amazonite::SecretsManagerV1
  class Filter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: ASM::FilterNameStringType)]
    property key : FilterNameStringType | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : FilterNameStringType | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end
  end
end
