private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class CreateSecretResponse
    include JSON::Serializable

    # The ARN of the new secret. The ARN includes the name of the secret followed by six random
    # characters. This ensures that if you create a new secret with the same name as a deleted secret,
    # then users with access to the old secret don't get access to the new secret because the ARNs are
    # different.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the new secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The unique identifier associated with the version of the new secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # A list of the replicas of this secret and their status:
    #
    # - `Failed`, which indicates that the replica was not created.
    #
    # - `InProgress`, which indicates that Secrets Manager is in the process of creating the replica.
    #
    # - `InSync`, which indicates that the replica was created.
    @[JSON::Field(key: "ReplicationStatus")]
    property replication_status : Array(ReplicationStatusType) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @replication_status : Array(ReplicationStatusType) | Nil = nil,
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

      if value = @version_id
        raise Core::ValidationError.new("VersionId length must be >= 32") if value.size < 32
        raise Core::ValidationError.new("VersionId length must be <= 64") if value.size > 64
      end

      if value = @replication_status
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@arn, @name, @version_id, @replication_status)
  end
end
