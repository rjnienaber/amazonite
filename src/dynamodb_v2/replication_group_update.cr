module Amazonite::DynamoDBV2
  # Represents one of the following:
  #
  # - A new replica to be added to an existing regional table or global table. This request invokes
  # the `CreateTableReplica` action in the destination Region.
  #
  # - New parameters for an existing replica. This request invokes the `UpdateTable` action in the
  # destination Region.
  #
  # - An existing replica to be deleted. The request invokes the `DeleteTableReplica` action in the
  # destination Region, deleting the replica and all if its items in the destination Region.
  #
  # When you manually remove a table or global table replica, you do not automatically remove any
  # associated scalable targets, scaling policies, or CloudWatch alarms.
  class ReplicationGroupUpdate
    include JSON::Serializable

    # The parameters required for creating a replica for the table.
    @[JSON::Field(key: "Create")]
    property create : CreateReplicationGroupMemberAction | Nil

    # The parameters required for updating a replica for the table.
    @[JSON::Field(key: "Update")]
    property update : UpdateReplicationGroupMemberAction | Nil

    # The parameters required for deleting a replica for the table.
    @[JSON::Field(key: "Delete")]
    property delete : DeleteReplicationGroupMemberAction | Nil

    def initialize(
      @create : CreateReplicationGroupMemberAction | Nil = nil,
      @update : UpdateReplicationGroupMemberAction | Nil = nil,
      @delete : DeleteReplicationGroupMemberAction | Nil = nil,
    )
    end

    def_equals_and_hash(@create, @update, @delete)
  end
end
