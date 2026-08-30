module Amazonite::KmsV1
  class DescribeKeyResponse
    include JSON::Serializable

    # Metadata associated with the key.
    @[JSON::Field(key: "KeyMetadata")]
    property key_metadata : KeyMetadata | Nil

    def initialize(
      @key_metadata : KeyMetadata | Nil = nil,
    )
    end

    def_equals_and_hash(@key_metadata)
  end
end
