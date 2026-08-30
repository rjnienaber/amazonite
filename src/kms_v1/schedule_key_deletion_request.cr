private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ScheduleKeyDeletionRequest
    include JSON::Serializable

    # The unique identifier of the KMS key to delete.
    #
    # Specify the key ID or key ARN of the KMS key.
    #
    # For example:
    #
    # - Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # - Key ARN: `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    # To get the key ID and key ARN for a KMS key, use ListKeys or DescribeKey.
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The waiting period, specified in number of days. After the waiting period ends, KMS deletes the
    # KMS key.
    #
    # If the KMS key is a multi-Region primary key with replica keys, the waiting period begins when
    # the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.
    #
    # This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you
    # do not include a value, it defaults to 30. You can use the [
    # `kms:ScheduleKeyDeletionPendingWindowInDays`
    # ](https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-schedule-key-deletion-pending-window-in-days)
    # condition key to further constrain the values that principals can specify in the
    # `PendingWindowInDays` parameter.
    @[JSON::Field(key: "PendingWindowInDays")]
    property pending_window_in_days : Int32 | Nil

    def initialize(
      @key_id : String,
      @pending_window_in_days : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end

      if value = @pending_window_in_days
        raise Core::ValidationError.new("PendingWindowInDays value must be >= 1") if value < 1
        raise Core::ValidationError.new("PendingWindowInDays value must be <= 365") if value > 365
      end
    end

    def_equals_and_hash(@key_id, @pending_window_in_days)
  end
end
