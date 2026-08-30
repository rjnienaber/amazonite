private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DeleteSecretResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The date and time after which this secret Secrets Manager can permanently delete this secret,
    # and it can no longer be restored. This value is the date and time of the delete request plus the
    # number of days in `RecoveryWindowInDays`.
    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @deletion_date : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@arn, @name, @deletion_date)
  end
end
