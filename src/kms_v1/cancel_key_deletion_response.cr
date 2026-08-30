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
  end
end
