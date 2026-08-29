module Amazonite::KmsV1
  class DescribeKeyResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyMetadata")]
    property key_metadata : KeyMetadata | Nil

    def initialize(
      @key_metadata : KeyMetadata | Nil = nil,
    )
    end
  end
end
