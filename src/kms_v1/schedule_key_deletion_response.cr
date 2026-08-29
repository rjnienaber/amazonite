private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ScheduleKeyDeletionResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    @[JSON::Field(key: "KeyState", converter: AK::KeyState)]
    property key_state : KeyState | Nil

    @[JSON::Field(key: "PendingWindowInDays")]
    property pending_window_in_days : Int32 | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @deletion_date : Time | Nil = nil,
      @key_state : KeyState | Nil = nil,
      @pending_window_in_days : Int32 | Nil = nil,
    )
    end
  end
end
