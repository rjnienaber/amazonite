private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ScheduleKeyDeletionResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key whose deletion is scheduled.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The date and time after which KMS deletes the KMS key.
    #
    # If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The
    # deletion date for the primary key isn't known until its last replica key is deleted.
    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    # The current status of the KMS key.
    #
    # For more information about how key state affects the use of a KMS key, see [Key states of KMS
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "KeyState", converter: AK::KeyState)]
    property key_state : KeyState | Nil

    # The waiting period before the KMS key is deleted.
    #
    # If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the
    # last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
    @[JSON::Field(key: "PendingWindowInDays")]
    property pending_window_in_days : Int32 | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @deletion_date : Time | Nil = nil,
      @key_state : KeyState | Nil = nil,
      @pending_window_in_days : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @deletion_date, @key_state, @pending_window_in_days)
  end
end
