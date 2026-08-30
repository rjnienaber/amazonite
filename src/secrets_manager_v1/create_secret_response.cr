module Amazonite::SecretsManagerV1
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

    def_equals_and_hash(@arn, @name, @version_id, @replication_status)
  end
end
