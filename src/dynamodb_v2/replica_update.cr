module Amazonite::DynamoDBV2
  # Represents one of the following:
  #
  # - A new replica to be added to an existing global table.
  #
  # - New parameters for an existing replica.
  #
  # - An existing replica to be removed from an existing global table.
  class ReplicaUpdate
    include JSON::Serializable

    # The parameters required for creating a replica on an existing global table.
    @[JSON::Field(key: "Create")]
    property create : CreateReplicaAction | Nil

    # The name of the existing replica to be removed.
    @[JSON::Field(key: "Delete")]
    property delete : DeleteReplicaAction | Nil

    def initialize(
      @create : CreateReplicaAction | Nil = nil,
      @delete : DeleteReplicaAction | Nil = nil,
    )
    end

    def_equals_and_hash(@create, @delete)
  end
end
