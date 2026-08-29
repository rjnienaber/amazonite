private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GenerateMacResponse
    include JSON::Serializable

    @[JSON::Field(key: "Mac", converter: Core::Base64Converter)]
    property mac : Bytes | Nil

    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @mac : Bytes | Nil = nil,
      @mac_algorithm : MacAlgorithmSpec | Nil = nil,
      @key_id : String | Nil = nil,
    )
    end
  end
end
