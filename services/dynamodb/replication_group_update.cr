private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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
  # - The local replica to be disassociated from a global table and retained as a standalone
  # regional table.
  #
  # Each `ReplicationGroupUpdate` contains exactly one action. A `Disassociate` action must be the
  # only replica update in the request; including other updates causes the request to fail.
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

    # The parameters for disassociating the local replica from the global table and retaining it as a
    # standalone regional table.
    @[JSON::Field(key: "Disassociate")]
    property disassociate : DisassociateReplicationGroupMemberAction | Nil

    def initialize(
      @create : CreateReplicationGroupMemberAction | Nil = nil,
      @update : UpdateReplicationGroupMemberAction | Nil = nil,
      @delete : DeleteReplicationGroupMemberAction | Nil = nil,
      @disassociate : DisassociateReplicationGroupMemberAction | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @create
        value.validate!
      end

      if value = @update
        value.validate!
      end

      if value = @delete
        value.validate!
      end

      if value = @disassociate
        value.validate!
      end
    end

    def_equals_and_hash(@create, @update, @delete, @disassociate)
  end
end
