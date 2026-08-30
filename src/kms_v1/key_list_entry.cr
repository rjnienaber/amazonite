private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Contains information about each entry in the key list.
  class KeyListEntry
    include JSON::Serializable

    # Unique identifier of the key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # ARN of the key.
    @[JSON::Field(key: "KeyArn")]
    property key_arn : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @key_arn
        raise Core::ValidationError.new("KeyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("KeyArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key_id, @key_arn)
  end
end
