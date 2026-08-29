private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetKeyRotationStatusResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyRotationEnabled")]
    property key_rotation_enabled : Bool | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "RotationPeriodInDays")]
    property rotation_period_in_days : Int32 | Nil

    @[JSON::Field(key: "NextRotationDate", converter: Core::AWSEpochConverter)]
    property next_rotation_date : Time | Nil

    @[JSON::Field(key: "OnDemandRotationStartDate", converter: Core::AWSEpochConverter)]
    property on_demand_rotation_start_date : Time | Nil

    def initialize(
      @key_rotation_enabled : Bool | Nil = nil,
      @key_id : String | Nil = nil,
      @rotation_period_in_days : Int32 | Nil = nil,
      @next_rotation_date : Time | Nil = nil,
      @on_demand_rotation_start_date : Time | Nil = nil,
    )
    end
  end
end
