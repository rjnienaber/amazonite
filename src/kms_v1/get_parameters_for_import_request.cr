private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GetParametersForImportRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "WrappingAlgorithm", converter: AK::AlgorithmSpec)]
    property wrapping_algorithm : AlgorithmSpec

    @[JSON::Field(key: "WrappingKeySpec", converter: AK::WrappingKeySpec)]
    property wrapping_key_spec : WrappingKeySpec

    def initialize(
      @key_id : String,
      @wrapping_algorithm : AlgorithmSpec,
      @wrapping_key_spec : WrappingKeySpec,
    )
    end
  end
end
