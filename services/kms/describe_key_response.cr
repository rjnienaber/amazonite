private alias Core = Amazonite::Core

module Amazonite::Kms
  class DescribeKeyResponse
    include JSON::Serializable

    # Metadata associated with the key.
    @[JSON::Field(key: "KeyMetadata")]
    property key_metadata : KeyMetadata | Nil

    def initialize(
      @key_metadata : KeyMetadata | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_metadata
        value.validate!
      end
    end

    def_equals_and_hash(@key_metadata)
  end
end
