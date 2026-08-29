module Amazonite::KmsV1
  class KeyListEntry
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "KeyArn")]
    property key_arn : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @key_arn : String | Nil = nil,
    )
    end
  end
end
