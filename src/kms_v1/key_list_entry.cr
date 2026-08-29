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
  end
end
