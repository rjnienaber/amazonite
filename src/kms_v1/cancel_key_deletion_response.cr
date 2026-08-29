module Amazonite::KmsV1
  class CancelKeyDeletionResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
    )
    end
  end
end
