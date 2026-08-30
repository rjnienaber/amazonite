module Amazonite::KmsV1
  class RotateKeyOnDemandResponse
    include JSON::Serializable

    # Identifies the symmetric encryption KMS key that you initiated on-demand rotation on.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id)
  end
end
