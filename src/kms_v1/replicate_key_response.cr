private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ReplicateKeyResponse
    include JSON::Serializable

    # Displays details about the new replica key, including its Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) and
    # [Key states of KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html).
    # It also includes the ARN and Amazon Web Services Region of its primary key and other replica
    # keys.
    @[JSON::Field(key: "ReplicaKeyMetadata")]
    property replica_key_metadata : KeyMetadata | Nil

    # The key policy of the new replica key. The value is a key policy document in JSON format.
    @[JSON::Field(key: "ReplicaPolicy")]
    property replica_policy : String | Nil

    # The tags on the new replica key. The value is a list of tag key and tag value pairs.
    @[JSON::Field(key: "ReplicaTags")]
    property replica_tags : Array(Tag) | Nil

    def initialize(
      @replica_key_metadata : KeyMetadata | Nil = nil,
      @replica_policy : String | Nil = nil,
      @replica_tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replica_key_metadata
        value.validate!
      end

      if value = @replica_policy
        raise Core::ValidationError.new("ReplicaPolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ReplicaPolicy length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("ReplicaPolicy does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end

      if value = @replica_tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@replica_key_metadata, @replica_policy, @replica_tags)
  end
end
