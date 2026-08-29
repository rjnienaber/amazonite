module Amazonite::KmsV1
  class ScheduleKeyDeletionRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "PendingWindowInDays")]
    property pending_window_in_days : Int32 | Nil

    def initialize(
      @key_id : String,
      @pending_window_in_days : Int32 | Nil = nil,
    )
    end
  end
end
