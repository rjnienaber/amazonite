private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateMacResponse
    include JSON::Serializable

    @[JSON::Field(key: "Mac")]
    property mac : String | Nil

    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @mac : String | Nil = nil,
      @mac_algorithm : MacAlgorithmSpec | Nil = nil,
      @key_id : String | Nil = nil,
    )
    end
  end
end
