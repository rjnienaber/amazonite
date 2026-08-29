module Amazonite::KmsV1
  class EnableKeyRotationRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "RotationPeriodInDays")]
    property rotation_period_in_days : Int32 | Nil

    def initialize(
      @key_id : String,
      @rotation_period_in_days : Int32 | Nil = nil,
    )
    end
  end
end
