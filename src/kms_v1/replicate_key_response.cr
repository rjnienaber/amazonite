module Amazonite::KmsV1
  class ReplicateKeyResponse
    include JSON::Serializable

    @[JSON::Field(key: "ReplicaKeyMetadata")]
    property replica_key_metadata : KeyMetadata | Nil

    @[JSON::Field(key: "ReplicaPolicy")]
    property replica_policy : String | Nil

    @[JSON::Field(key: "ReplicaTags")]
    property replica_tags : Array(Tag) | Nil

    def initialize(
      @replica_key_metadata : KeyMetadata | Nil = nil,
      @replica_policy : String | Nil = nil,
      @replica_tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
