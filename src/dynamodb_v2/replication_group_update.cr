module Amazonite::DynamoDBV2
  class ReplicationGroupUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Create")]
    property create : CreateReplicationGroupMemberAction | Nil

    @[JSON::Field(key: "Update")]
    property update : UpdateReplicationGroupMemberAction | Nil

    @[JSON::Field(key: "Delete")]
    property delete : DeleteReplicationGroupMemberAction | Nil

    def initialize(
      @create : CreateReplicationGroupMemberAction | Nil = nil,
      @update : UpdateReplicationGroupMemberAction | Nil = nil,
      @delete : DeleteReplicationGroupMemberAction | Nil = nil
    )
    end
  end
end
