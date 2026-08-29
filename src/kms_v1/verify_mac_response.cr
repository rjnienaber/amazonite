private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class VerifyMacResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "MacValid")]
    property mac_valid : Bool | Nil

    @[JSON::Field(key: "MacAlgorithm", converter: AK::MacAlgorithmSpec)]
    property mac_algorithm : MacAlgorithmSpec | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @mac_valid : Bool | Nil = nil,
      @mac_algorithm : MacAlgorithmSpec | Nil = nil,
    )
    end
  end
end
