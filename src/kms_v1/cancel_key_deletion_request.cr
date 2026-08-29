module Amazonite::KmsV1
  class CancelKeyDeletionRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    def initialize(
      @key_id : String,
    )
    end
  end
end
