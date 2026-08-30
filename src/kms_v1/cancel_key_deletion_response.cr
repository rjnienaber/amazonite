private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CancelKeyDeletionResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key whose deletion is canceled.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key_id)
  end
end
