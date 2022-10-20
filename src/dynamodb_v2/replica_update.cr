module Amazonite::DynamoDBv2
  class ReplicaUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Create")]
    property create : CreateReplicaAction | Nil

    @[JSON::Field(key: "Delete")]
    property delete : DeleteReplicaAction | Nil

    def initialize(
      @create : CreateReplicaAction | Nil = nil,
      @delete : DeleteReplicaAction | Nil = nil
    )
    end
  end
end
