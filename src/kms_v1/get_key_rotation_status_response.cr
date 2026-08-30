private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetKeyRotationStatusResponse
    include JSON::Serializable

    # A Boolean value that specifies whether key rotation is enabled.
    @[JSON::Field(key: "KeyRotationEnabled")]
    property key_rotation_enabled : Bool | Nil

    # Identifies the specified symmetric encryption KMS key.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The number of days between each automatic rotation. The default value is 365 days.
    @[JSON::Field(key: "RotationPeriodInDays")]
    property rotation_period_in_days : Int32 | Nil

    # The next date that KMS will automatically rotate the key material.
    @[JSON::Field(key: "NextRotationDate", converter: Core::AWSEpochConverter)]
    property next_rotation_date : Time | Nil

    # Identifies the date and time that an in progress on-demand rotation was initiated.
    #
    # KMS uses a background process to perform rotations. As a result, there might be a slight delay
    # between initiating on-demand key rotation and the rotation's completion. Once the on-demand
    # rotation is complete, KMS removes this field from the response. You can use ListKeyRotations to
    # view the details of the completed on-demand rotation.
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

    def_equals_and_hash(@key_rotation_enabled, @key_id, @rotation_period_in_days, @next_rotation_date, @on_demand_rotation_start_date)
  end
end
