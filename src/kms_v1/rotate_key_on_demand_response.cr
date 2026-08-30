private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@key_id)
  end
end
